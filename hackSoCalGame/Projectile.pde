class Projectile {
  PVector pos;
  PVector velocity;
  PVector force;
  Shape shape;
  color c;
  float gravity = 0.5;
  Player player;


  Projectile(PVector pos, PVector velocity, color c, Player player) {  
    this.velocity = velocity;
    this.c = c;
    this.pos = pos;
    this.force = new PVector(0, 0);
    this.shape = new Shape(pos, new PVector(10, 10), c, false);
    this.player = player;
  }

  void render() {

    this.force = new PVector(this.force.x, this.force.y + gravity);


    this.velocity.add(this.force);
    this.pos.add(this.velocity);

    this.shape.pos = this.pos;
    this.shape.drawShape();
    this.force.mult(0);
  }
}
