Player gamer;
Player gamer1;
boolean[] keys;
int blockCount = 20;
Shape[] blocks = new Shape[blockCount + 5 + 5];
Projectile[] bullets = new Projectile[0];

int p1Wins = 0;
int p2Wins = 0;
PFont minecraft;

PImage blockSprite;
PImage blockBreakSprite;

boolean running = false;

void setup() {

  size(1920, 1080);
  reset();
}


void draw() {
  if(running){
  background(255);

  for (Shape shape : blocks) {
    if (shape.collided(gamer.shape)) {
      shape.fadeShape();
      shape.reduceTime(5);
    }
    if (shape.collided(gamer1.shape)) {
      shape.fadeShape();
      shape.reduceTime(5);
    }
    for (Projectile bullet : bullets) {
      if (shape.collided(bullet.shape)) {
        shape.fadeShape();
        shape.reduceTime(500);
        bullet.shape.removeShape();
      }
    }
    shape.drawShape();
  }

  for (Projectile bullet : bullets) {
    if (bullet.shape.collided(gamer.shape) && bullet.player != gamer) {
      gamer.vel.add(bullet.velocity.mult(0.2));
    }
    if (bullet.shape.collided(gamer1.shape) && bullet.player != gamer1) {
      gamer1.vel.add(bullet.velocity.mult(0.2));
    }
    bullet.render();
  }
  
  if(gamer.alive == false){
    p2Wins++;
    reset();
  }
  
  if(gamer1.alive == false){
    p1Wins++;
    reset();
  }
  
  gamer.render();
  gamer1.render();
  
  fill(0);
  textFont(minecraft);
  textSize(100);
  textAlign(CENTER, CENTER);
  text(str(p1Wins), 800, 150);
  text(str(p2Wins), 1060, 150);
  } else startScreen();
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
  if (key=='/')
    keys[9]=true;
  if (key == CODED) {
    if (keyCode == UP)
      keys[5]=true;
    if (keyCode == LEFT)
      keys[6]=true;
    if (keyCode == DOWN)
      keys[7]=true;
    if (keyCode == RIGHT)
      keys[8]=true;
  }
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
  if (key=='f')
    keys[4]=false;
  if (key=='/')
    keys[9]=false;
  if (key == CODED) {
    if (keyCode == UP)
      keys[5]=false;
    if (keyCode == LEFT)
      keys[6]=false;
    if (keyCode == DOWN)
      keys[7]=false;
    if (keyCode == RIGHT)
      keys[8]=false;
  }
}

boolean overlap(float rectOneX, float rectOneY, float rectOneWidth, float rectOneHeight, float rectTwoX, float rectTwoY, float rectTwoWidth, float rectTwoHeight) {
  if (rectOneX < rectTwoX + rectTwoWidth && rectOneX + rectOneWidth > rectTwoX && rectOneY < rectTwoY + rectTwoHeight && rectOneHeight + rectOneY > rectTwoY) {
    return true;
  } else return false;
}

void reset() {
  gamer = new Player(new PVector(100, 50), 0.9, 0.7, false, "princess.png");
  gamer1 = new Player(new PVector(1720, 50), 0.9, 0.7, true, "wizard.png");
  keys=new boolean[10];
  keys = new boolean[] {false, false, false, false, false, false, false, false, false, false}; 
  minecraft = createFont("Minecraft.ttf", 32); 

  blockSprite = loadImage("fullPlatform.png");
  blockBreakSprite = loadImage("BreakingPlatform.png");

  for (int i=0; i<blockCount; i++) {
    blocks[i] = new Shape(new PVector(map(i, 0, blockCount, 300, 1590), 700), new PVector(1840/blockCount, 50), color(0), true, null);
  }

  for (int i=blockCount; i<blockCount + 5; i++) {
    blocks[i] = new Shape(new PVector(map(i, blockCount, blockCount + 5.5, 70, 530), 470), new PVector(1840/blockCount, 50), color(0), true, null);
  }

  for (int i=blockCount+5; i<blockCount + 10; i++) {
    blocks[i] = new Shape(new PVector(map(i, blockCount + 5, blockCount + 10, 1400, 1840), 470), new PVector(1840/blockCount, 50), color(0), true, null);
  }
}
