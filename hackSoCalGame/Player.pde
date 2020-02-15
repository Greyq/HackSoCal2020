class Player {
  PVector pos;
  PVector vel;
  float friction;
  float gravity;
  int jumps;
  boolean onGround;

  Player(PVector pos, float friction, float gravity) {
    this.pos = pos;
    this.friction = friction;
    this.gravity = gravity;
    this.jumps = 2;
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
    fill(255, 0, 0);
    rect(pos.x, pos.y, 20, 20);
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
      if (key == 'w') {
        this.onGround = false;
        force.add(new PVector(0, -1));
        println("w");
      }

      if (key == 'a') {
        force.add(new PVector(-1, 0));
      }

      if (key == 's') {
        force.add(new PVector(0, 0));
      }

      if (key == 'd') {
        force.add(new PVector(1, 0));
      }
    }
    return force;
  }
}
