Shape playerShape;

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

  //The player that we can create
  Player(PVector pos, float friction, float gravity) {
    this.pos = pos;
    this.friction = friction;
    this.gravity = gravity;
    this.jumps = 0;
    this.force = new PVector(0, 0);
    this.alive = true;
    this.vel = new PVector(0, 0);
  }

  //Draws the player
  void render() {
    if (this.onGround) {
      jumps = 1;
    } 

    this.alive = this.inBounds();

    this.force.add(move());
    this.force = new PVector(this.force.x, this.force.y + gravity);
    for (Shape shape : blocks){
      this.collide(shape);
    }

    this.vel.add(this.force);
    this.vel.mult(friction);
    this.pos.add(this.vel);

    if (this.alive == false) {
      this.pos = new PVector(0, 0);
      this.onGround = false;
      this.alive = true;
    }

    this.shape = new Shape(pos, new PVector(20, 20), color(255, 0, 0));
    this.shape.drawShape();
    this.force.mult(0);
  }

  //Manages the collisions
  void collide(Shape shape) {
    if (overlap(int(this.pos.x), int(this.pos.y), 20, 20, shape.pos.x, shape.pos.y, shape.size.x, shape.size.y)) {
      if (this.pos.y < shape.pos.y) {
        this.force = new PVector(this.force.x, min(this.force.y, -this.vel.y));
        this.force = new PVector(this.force.x, this.force.y - 1);
        onGround = true;
      } else onGround = false;

      if (this.pos.y > shape.pos.y) {
        this.force = new PVector(this.force.x, max(this.force.y, -this.vel.y));
      }

      if (this.pos.x < shape.pos.x && onGround == false) {
        this.force = new PVector(min(this.force.x, -this.vel.x), this.force.y);
      }

      if (this.pos.x > shape.pos.x && onGround == false) {
        this.force = new PVector(max(this.force.x, -this.vel.x), this.force.y);
      }
    }
  }

  //Uses keyboard to move
  PVector move() {
    PVector force = new PVector(0, 0);
    if (keyPressed) {
      if (keys[0] == true && this.jumps > 0) {
        println(this.jumps);
        this.jumps -= 1;
        this.onGround = false;
        force.add(new PVector(0, -30));
      }
      if (keys[1]) {
        force.add(new PVector(-1, 0));
      }

      if (keys[2]) {
        force.add(new PVector(0, 0));
      }

      if (keys[3]) {
        force.add(new PVector(1, 0));
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
}  
