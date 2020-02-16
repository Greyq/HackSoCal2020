PGraphics game;

Player gamer;
Player gamer1;
boolean[] keys;
Shape[] blocks;
Projectile[] bullets = new Projectile[0];

int p1Wins = 0;
int p2Wins = 0;
PFont minecraft;

PImage blockSprite;
PImage blockBreakSprite;

boolean running = false;
PImage background;

PImage p1ProjSprite;
PImage p2ProjSprite;

PImage p1Fire;
PImage p2Fire;

float xLeftBound;
float xRightBound;
float yLeftBound;
float yRightBound;

void setup() {
  //size(1920, 1080, P2D);
  fullScreen(P2D);
  game = createGraphics(1920, 1080);
  reset();

  xLeftBound = map(750, 0, 1920, 0, width);
  xRightBound = map(1120, 0, 1920, 0, width);
  yLeftBound = map(710, 0, 1080, 0, height);
  yRightBound = map(820, 0, 1080, 0, height);
}

void draw() {
  game.beginDraw();
  if (running) {
    game.image(background, 0, 0);

    for (Shape shape : blocks) {
      if (shape.on == false) continue;
      /*if (shape.collided(gamer.shape)) {
       shape.fadeShape();
       shape.reduceTime(5);
       }
       if (shape.collided(gamer1.shape)) {
       shape.fadeShape();
       shape.reduceTime(5);
       }*/
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
        gamer.vel.add(bullet.velocity.mult(0.4));
      }
      if (bullet.shape.collided(gamer1.shape) && bullet.player != gamer1) {
        gamer1.vel.add(bullet.velocity.mult(0.4));
      }
      bullet.render();
    }

    if (gamer.alive == false) {
      p2Wins++;
      reset();
    }

    if (gamer1.alive == false) {
      p1Wins++;
      reset();
    }

    gamer.render();
    gamer1.render();

    game.fill(0);
    game.textFont(minecraft);
    game.textSize(100);
    game.textAlign(CENTER, CENTER);
    game.text(str(p1Wins), 790, 200);
    game.text(str(p2Wins), 1140, 200);
  } else startScreen();
  game.endDraw();
  image(game, 0, 0, width, height);
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
  gamer1 = new Player(new PVector(1770, 50), 0.9, 0.7, true, "wizard.png");
  keys=new boolean[10];
  keys = new boolean[] {false, false, false, false, false, false, false, false, false, false}; 
  minecraft = createFont("Minecraft.ttf", 32); 

  blockSprite = loadImage("fullPlatform2.png");
  blockBreakSprite = loadImage("breakingPlatform2.png");
  background = loadImage("back.png");
  p1ProjSprite = loadImage("princessProj.png");
  p2ProjSprite = loadImage("wizardProj.png");
  p1Fire = loadImage("princessFire.png");
  p2Fire = loadImage("wizardFire.png");

  p1Fire.resize(500/7, 789/7);
  p2Fire.resize(500/7, 789/7);

  p1ProjSprite.resize(20, 20);
  p2ProjSprite.resize(20, 20);
  bullets = new Projectile[0];
  
  map2();
}
