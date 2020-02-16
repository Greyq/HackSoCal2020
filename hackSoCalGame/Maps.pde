void map1() {
  blocks = new Shape[40];
  for (int i=0; i<10; i++) {
    blocks[i] = new Shape(new PVector(map(i, 0, 10, 300, 760), 650), new PVector(46, 25), color(0), true, null);
  }

  for (int i=10; i<15; i++) {
    blocks[i] = new Shape(new PVector(map(i, 10, 15, 70, 300), 470), new PVector(46, 25), color(0), true, null);
  }

  for (int i=15; i<20; i++) {
    blocks[i] = new Shape(new PVector(map(i, 15, 20, 1620, 1850), 470), new PVector(46, 25), color(0), true, null);
  }

  for (int i=20; i<30; i++) {
    blocks[i] = new Shape(new PVector(map(i, 20, 30, 1160, 1620), 650), new PVector(46, 25), color(0), true, null);
  }

  for (int i=30; i<40; i++) {
    blocks[i] = new Shape(new PVector(map(i, 30, 40, 730, 1190), 800), new PVector(46, 25), color(0), true, null);
  }
}

void map2(){
  blocks = new Shape[40];
  background = loadImage("cave.png");
  
  for(int i=0; i<40; i++){
    blocks[i] = new Shape(new PVector(map(i, 0, 40, 80, 1840), 800), new PVector(46, 25), color(0), true, null);
  }
}

void map3(){
  blocks = new Shape[21];
  background = loadImage("castleBack.png");
  
  for(int i=0; i<14; i++){
    blocks[i] = new Shape(new PVector(map(i, 0, 14, 638, 1282), 550), new PVector(46, 25), color(0), true, null);
  }
  
  for(int i=14; i<21; i++){
    blocks[i] = new Shape(new PVector(map(i, 14, 21, 822, 1144), 300), new PVector(46, 25), color(0), true, null);
  }
}
