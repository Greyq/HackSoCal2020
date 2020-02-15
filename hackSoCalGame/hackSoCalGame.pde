Player gamer;
boolean[] keys;
Shape[] blocks = new Shape[10];


void setup() {
  size(1920, 1080);
  gamer = new Player(new PVector(100, 50), 0.9, 1);
  keys=new boolean[4];
  keys = new boolean[] {false, false, false, false}; 
  
  for(int i=0; i<10; i++){
    blocks[i] = new Shape(new PVector(map(i, 0, 10, 70, 1840), 700), new PVector(177, 100), color(0)); 
  }
}


void draw() {
  background(255);
  fill(0);
  //rect(70, 700, 1770, 100);
  for (Shape shape : blocks){
    shape.drawShape();
  }
  gamer.render();
}  


void keyPressed() {
  if (key=='w')
    keys[0]=true;
  if (key=='a')
    keys[1]=true;
  if (key=='s')
    keys[2]=true;
  if (key=='d')
    keys[3]=true;
}

void keyReleased() {
  if (key=='w')
    keys[0]=false;
  if (key=='a')
    keys[1]=false;
  if (key=='s')
    keys[2]=false;
  if (key=='d')
    keys[3]=false;
}

boolean overlap(float rectOneX, float rectOneY, float rectOneWidth, float rectOneHeight, float rectTwoX, float rectTwoY, float rectTwoWidth, float rectTwoHeight){
   if (rectOneX < rectTwoX + rectTwoWidth && rectOneX + rectOneWidth > rectTwoX && rectOneY < rectTwoY + rectTwoHeight && rectOneHeight + rectOneY > rectTwoY){
     return true;
   } else return false;
}

void mousePressed(){
  blocks[0].removeShape();
}
