
class Player {
  //The variables we need for the player to allow movement
  PVector pos;
  PVector vel;
  float friction;
  float gravity;
  PVector force;
  int jumps;
  boolean onGround;
  Shape shape;
  boolean alive;
  Timer shootTimer = new Timer();
  boolean player2;
  int inputStartVal = 0;
  PImage sprite;

  //The player that we can create
  Player(PVector pos, float friction, float gravity, boolean player2, String sprite) {
    this.pos = pos;
    this.friction = friction;
    this.gravity = gravity;
    this.jumps = 0;
    this.force = new PVector(0, 0);
    this.alive = true;
    this.vel = new PVector(0, 0);
    this.sprite = loadImage(sprite);
    this.sprite.resize(500/7, 789/7);
    this.shape = new Shape(pos, new PVector(500/7, 789/7), color(255, 0, 0), false, this.sprite);
    this.player2 = player2;
    if (player2) this.inputStartVal = 5;
  }

  //Draws the player
  void render() {
    this.fire();
    if (this.onGround) {
      jumps = 1;
    } 

    this.alive = this.inBounds();

    this.force = new PVector(this.force.x, this.force.y + gravity);
    for (Shape shape : blocks) {
      this.collide(shape);
    }
    this.force.add(move());

    this.vel.add(this.force);
    this.vel.mult(friction);
    this.pos.add(this.vel);

    this.shape.pos = this.pos;
    this.shape.drawShape();
    this.force.mult(0);
  }

  //Manages the collisions
  void collide(Shape shape) {
    if (overlap(int(this.pos.x), int(this.pos.y), this.shape.size.x, this.shape.size.y, shape.pos.x, shape.pos.y, shape.size.x, shape.size.y) && shape.on) {
      if (this.pos.y < shape.pos.y) {
        this.force = new PVector(this.force.x, min(this.force.y, -this.vel.y));
        onGround = true;
      } else onGround = false;

      if (this.pos.y > shape.pos.y) {
        this.force = new PVector(this.force.x, max(this.force.y, -this.vel.y));
        this.force = new PVector(this.force.x, this.force.y + 1);
      }

      if (this.pos.x < shape.pos.x && onGround == false) {
        this.force = new PVector(min(this.force.x, -this.vel.x), this.force.y);
        //this.force = new PVector(this.force.x + 1, this.force.y);
      }

      if (this.pos.x > shape.pos.x && onGround == false) {
        this.force = new PVector(max(this.force.x, -this.vel.x), this.force.y);
        //this.force = new PVector(this.force.x - 1, this.force.y);
      }
    }
  }

  //Uses keyboard to move
  PVector move() {
    PVector force = new PVector(0, 0);
    if (keyPressed) {
      if (keys[this.inputStartVal] == true && this.jumps > 0) {
        this.jumps -= 1;
        this.onGround = false;
        this.force.add(new PVector(0, -40));
      }
      if (keys[this.inputStartVal + 1]) {
        this.force.add(new PVector(-1, 0));
      }

      if (keys[this.inputStartVal + 2]) {
        this.force.add(new PVector(0, 0));
      }

      if (keys[this.inputStartVal + 3]) {
        this.force.add(new PVector(1, 0));
      }
    }
    return force;
  }

  //Keeps player from going off the screen
  boolean inBounds() {
    if (this.pos.y > height) {
      return false;
    } else return true;
  }

  void fire() {
    if (keyPressed && keys[this.inputStartVal + 4] && this.shootTimer.passed(300)) {
      this.shootTimer.reset();
      bullets = (Projectile[]) append(bullets, new Projectile(this.pos.copy(), new PVector(this.vel.x*5, this.vel.y), color(0), this));
    }
  }
}  
