class Projectile {
  PVector pos;
  PVector velocity;
  PVector force;
  Shape shape;
  color c;
  float gravity = 0.5;
  
  
  Projectile(PVector pos, PVector velocity, color c) {  this.velocity = velocity;
    this.c = c;
    this.pos = pos;
    this.force = new PVector(0, 0);
  }
  
  void fire() {

    this.force = new PVector(this.force.x, this.force.y + gravity);


    this.velocity.add(this.force);
    this.pos.add(this.velocity);

    this.shape = new Shape(pos, new PVector(10, 10), c, false);
    this.shape.drawShape();
    this.force.mult(0);
    
  }
  
}
