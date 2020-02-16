class Projectile {
  PVector pos;
  PVector velocity;
  PVector force;
  Shape shape;
  color c;
  float gravity = 0.5;
  Player player;
  PImage sprite;

  Projectile(PVector pos, PVector velocity, color c, Player player, PImage sprite) {  
    this.velocity = velocity;
    this.c = c;
    this.pos = pos;
    this.force = new PVector(0, 0);
    this.sprite = sprite;
    this.shape = new Shape(pos, new PVector(10, 10), c, false, this.sprite);
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
