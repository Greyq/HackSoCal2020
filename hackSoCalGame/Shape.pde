class Shape {
  PVector pos;
  PVector size;
  PVector vel;
  color c;
  //ArrayList shnapes;
  
  Shape(PVector pos, PVector size, color c) {
    this.pos = pos;
    this.size = size;
    this.c = c;
    this.vel = new PVector(0, 0);
    //shnapes.add(this);
  }
  
  void drawShape() {
    fill(c);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
  }
  
  void removeShape(){
    this.size = new PVector(0, 0);  
  }
}
