Player player;
boolean[] keys;

void setup() {
  size(1920, 1080);
  player = new Player(new PVector(100, 50), 0.9, 1);
  keys=new boolean[4];
  keys = new boolean[] {false, false, false, false};
}


void draw() {
  background(255);
  fill(0);
  rect(70, 700, 1770, 100);
  player.render();
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

boolean overlap(int rectOneX, int rectOneY, int rectOneWidth, int rectOneHeight, int rectTwoX, int rectTwoY, int rectTwoWidth, int rectTwoHeight){
   if (rectOneX < rectTwoX + rectTwoWidth && rectOneX + rectOneWidth > rectTwoX && rectOneY < rectTwoY + rectTwoHeight && rectOneHeight + rectOneY > rectTwoY){
     return true;
   } else return false;
}
