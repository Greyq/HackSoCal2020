class Shape {
  PVector pos;
  PVector size;
  PVector vel;
  //ArrayList shnapes;
  
  Shape(PVector pos, PVector size) {
    this.pos = pos;
    this.size = size;
    vel = new PVector(0, 0);
    //shnapes.add(this);
  }
  
  void draw(int red, int green, int blue) {
    fill(red, green, blue);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
