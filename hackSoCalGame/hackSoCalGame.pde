Player gamer;
boolean[] keys;
Shape[] blocks = new Shape[10];
Projectile shoot;


void setup() {
  size(1920, 1080);
  gamer = new Player(new PVector(100, 50), 0.9, 1);
  shoot = new Projectile(new PVector(100, 50), new PVector(30, 0), color(0));
  keys=new boolean[5];
  keys = new boolean[] {false, false, false, false, false}; 
  
  for(int i=0; i<10; i++){
    blocks[i] = new Shape(new PVector(map(i, 0, 10, 70, 1840), 700), new PVector(184, 100), color(0), true); 
  }
}


void draw() {
  background(255);
  for (Shape shape : blocks){
    if(shape.playerOn()) shape.fadeShape();
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
  if (key=='f')
    keys[4]=true;
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
   if (key=='  f')
    keys[4]=true;
}

boolean overlap(float rectOneX, float rectOneY, float rectOneWidth, float rectOneHeight, float rectTwoX, float rectTwoY, float rectTwoWidth, float rectTwoHeight){
   if (rectOneX < rectTwoX + rectTwoWidth && rectOneX + rectOneWidth > rectTwoX && rectOneY < rectTwoY + rectTwoHeight && rectOneHeight + rectOneY > rectTwoY){
     return true;
   } else return false;
}
