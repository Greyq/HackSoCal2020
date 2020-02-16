class Shape {
  PVector pos;
  PVector size;
  PVector vel;
  color c;
  boolean fading;
  Timer fadeTimer;
  boolean block;
  boolean on;

  Shape(PVector pos, PVector size, color c, boolean block) {
    this.pos = pos;
    this.size = size;
    this.c = c;
    this.vel = new PVector(0, 0);
    this.fading = false;
    this.fadeTimer = new Timer();
    this.block = block;
    this.on = true;
  }

  void drawShape() {
    strokeWeight(5);
    stroke(c);
    if (this.on) {
      if (this.fading && this.block) {
        stroke(0);
        this.c = color(255);
        if (fadeTimer.passed(1000)) {
          this.removeShape();
        }
      }
      
      fill(c);
      rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
    }
  }

  void removeShape() {
    this.on = false;
  } 

  boolean playerOn() {
    return overlap(gamer.pos.x, gamer.pos.y, 20, 20, this.pos.x, this.pos.y, this.size.x, this.size.y);
  }

  void fadeShape() {
    if(fading == false) this.fadeTimer.reset();
    this.fading = true;
  }
}
