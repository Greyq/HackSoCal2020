Shape playerShape;

class Player {
  PVector pos;
  PVector vel;
  float friction;
  float gravity;
  int jumps;
  boolean onGround;
  Shape shape;

  Player(PVector pos, float friction, float gravity) {
    this.pos = pos;
    this.friction = friction;
    this.gravity = gravity;
    this.jumps = 1;
    vel = new PVector(0, 0);
  }

  void render() {
    if (this.onGround == false) vel.add(new PVector(0, gravity));
    this.onGround = this.collide();

    if (this.onGround) {
      vel = new PVector(vel.x, 0);
      jumps = 2;
    }
    vel.add(move());
    vel.mult(friction);
    this.pos.add(this.vel);
    this.shape = new Shape(pos, new PVector(20, 20));
    this.shape.draw(255, 0, 0);
  }

  boolean collide() {
    if (this.pos.y - 680 >= 0 && this.pos.x > 70 && this.pos.x < 1840 && this.onGround == false) {
      return true;
    } else return false;
  }

  PVector move() {
    PVector force = new PVector(0, 0);
    if (keyPressed) {
      println("key");
      if (keys[0] == true && this.jumps > 0) {
        this.jumps -= 1;
        this.onGround = false;
        force.add(new PVector(0, -10));
        println("w");
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
}
