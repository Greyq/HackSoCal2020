class Shape {
  PVector pos;
  PVector size;
  PVector vel;
  color c;
  boolean fading;
  Timer fadeTimer;
  boolean block;
  boolean on;
  double time = 1500;
  PImage sprite;

  Shape(PVector pos, PVector size, color c, boolean block, PImage sprite) {
    this.pos = pos;
    this.size = size;
    this.c = c;
    this.vel = new PVector(0, 0);
    this.fading = false;
    this.fadeTimer = new Timer();
    this.block = block;
    this.on = true;
    this.sprite = sprite;
  }

  void drawShape() {
    game.noStroke();
    if (this.on) {
      if (this.fading && this.block) {
        this.c = color(255);
        if (fadeTimer.passed(this.time)) {
          this.removeShape();
        }
      }

      fill(c);
      if (sprite == null) {
        game.rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
      } else {
        game.image(sprite, this.pos.x, this.pos.y);
      }

      if (this.block) {
        blockSprite.resize(46, 25);
        game.image(blockSprite, this.pos.x, this.pos.y);
        if (this.fading) {
          blockBreakSprite.resize(46, 25);
          game.image(blockBreakSprite, this.pos.x, this.pos.y);
        }
      }
    }
  }

  void removeShape() {
    this.on = false;
  } 

  boolean collided(Shape s) {
    return overlap(s.pos.x, s.pos.y, s.size.x, s.size.y, this.pos.x, this.pos.y, this.size.x, this.size.y);
  }

  void fadeShape() {
    if (fading == false) this.fadeTimer.reset();
    this.fading = true;
  }

  void reduceTime(double time) {
    this.time -= time;
  }
}
