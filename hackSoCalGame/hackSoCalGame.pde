import ddf.minim.*;
import ddf.minim.ugens.*;

//Audio player used for sound effects and music
Minim minim;
AudioPlayer fireball;
AudioPlayer music;

PGraphics game;

Player gamer;
Player gamer1;
boolean[] keys;
Shape[] blocks;
Projectile[] bullets = new Projectile[0];

int p1Wins;
int p2Wins;
PFont minecraft;

PImage blockSprite;
PImage blockBreakSprite;

boolean running = false;
boolean mapSelect = false;
boolean modes = false;
PImage background;

PImage p1ProjSprite;
PImage p2ProjSprite;

PImage p1Fire;
PImage p2Fire;

float xLeftBound;
float xRightBound;
float yLeftBound;
float yRightBound;

Oscil wave;
AudioOutput out;



void setup() {
  
  //2 modes, fullscreen and windowed, must be chosen before running game
  
  //size(1920, 1080, P2D);
  fullScreen(P2D);

  //where we load the sound
  minim = new Minim(this);
  fireball = minim.loadFile("fireball.wav");
  music = minim.loadFile("home.mp3");
  
  game = createGraphics(1920, 1080);
  //where we load the sprites
  blockSprite = loadImage("fullPlatform2.png");
  blockBreakSprite = loadImage("breakingPlatform2.png");
  background = loadImage("back.png");
  p1ProjSprite = loadImage("princessProj.png");
  p2ProjSprite = loadImage("wizardProj.png");
  p1Fire = loadImage("princessFire.png");
  p2Fire = loadImage("wizardFire.png");

  map1 = loadImage("map1.png");
  map1.resize(1920/4, 1080/4);

  map2 = loadImage("map2.png");
  map2.resize(1920/4, 1080/4);

  map3 = loadImage("map3.png");
  map3.resize(1920/4, 1080/4);

  map4 = loadImage("map4.png");
  map4.resize(1920/4, 1080/4);

  map5 = loadImage("map5.png");
  map5.resize(1920/4, 1080/4);

  map6 = loadImage("map6.png");
  map6.resize(1920/4, 1080/4);

  p1Fire.resize(500/7, 789/7);
  p2Fire.resize(500/7, 789/7);

  p1ProjSprite.resize(20, 20);
  p2ProjSprite.resize(20, 20);

  reset();

  //defines boundries for all button
  xLeftBound = map(750, 0, 1920, 0, width);
  xRightBound = map(1120, 0, 1920, 0, width);
  yLeftBound = map(710, 0, 1080, 0, height);
  yRightBound = map(820, 0, 1080, 0, height);

  map1XLeft = map(84, 0, 1920, 0, width);
  map1XRight = map(84+1920/4, 0, 1920, 0, width);
  map1YLeft = map(300, 0, 1080, 0, height);
  map1YRight = map(300+1080/4, 0, 1080, 0, height);

  map2XLeft = map(960 - 1920/8, 0, 1920, 0, width);
  map2XRight = map(960 - 1920/8+1920/4, 0, 1920, 0, width);
  map2YLeft = map(300, 0, 1080, 0, height);
  map2YRight = map(300+1080/4, 0, 1080, 0, height);

  map3XLeft = map(1352, 0, 1920, 0, width);
  map3XRight = map(1352+1920/4, 0, 1920, 0, width);
  map3YLeft = map(300, 0, 1080, 0, height);
  map3YRight = map(300+1080/4, 0, 1080, 0, height);

  map4XLeft = map(84, 0, 1920, 0, width);
  map4XRight = map(84+1920/4, 0, 1920, 0, width);
  map4YLeft = map(700, 0, 1080, 0, height);
  map4YRight = map(700+1080/4, 0, 1080, 0, height);

  map5XLeft = map(960 - 1920/8, 0, 1920, 0, width);
  map5XRight = map(960 - 1920/8+1920/4, 0, 1920, 0, width);
  map5YLeft = map(700, 0, 1080, 0, height);
  map5YRight = map(700+1080/4, 0, 1080, 0, height);

  map6XLeft = map(1352, 0, 1920, 0, width);
  map6XRight = map(1352+1920/4, 0, 1920, 0, width);
  map6YLeft = map(700, 0, 1080, 0, height);
  map6YRight = map(700+1080/4, 0, 1080, 0, height);
  
  timeXLeft = map(220, 0, 1920, 0, width);
  timeXRight = map(220 + 265, 0, 1920, 0, width);
  timeYLeft = map(350, 0, 1080, 0, height);
  timeYRight = map(350 + 100, 0, 1080, 0, height);
  
  livesXLeft = map(1435, 0, 1920, 0, width);
  livesXRight = map(1435 + 265, 0, 1920, 0, width);
  livesYLeft = map(350, 0, 1080, 0, height);
  livesYRight = map(350 + 100, 0, 1080, 0, height);

  plusXLeft = map(650, 0, 1920, 0, width);
  plusXRight = map(650 + 100, 0, 1920, 0, width);
  plusYLeft = map(705, 0, 1080, 0, height);
  plusYRight = map(705 + 100, 0, 1080, 0, height);
  
  minusXLeft = map(1170, 0, 1920, 0, width);
  minusXRight = map(1170 + 100, 0, 1920, 0, width);
  minusYLeft = map(705, 0, 1080, 0, height);
  minusYRight = map(705 + 100, 0, 1080, 0, height);
}

void draw() {
  //load screen that should be loaded
  game.beginDraw();
  if (mapSelect) {
    mapScreen();
  } else if (running) {
    gameLoop();
  } else if (modes) {
    modesScreen();
 } else startScreen();
  game.endDraw();
  image(game, 0, 0, width, height);
}  


//check what keys are being pressed
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
  //return to map select
  if (key == 'm') {
    mapSelect = true;
    running = false;
  }
}

//remove keys from list if released
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


//Checks if objects are overlapping
boolean overlap(float rectOneX, float rectOneY, float rectOneWidth, float rectOneHeight, float rectTwoX, float rectTwoY, float rectTwoWidth, float rectTwoHeight) {
  if (rectOneX < rectTwoX + rectTwoWidth && rectOneX + rectOneWidth > rectTwoX && rectOneY < rectTwoY + rectTwoHeight && rectOneHeight + rectOneY > rectTwoY) {
    return true;
  } else return false;
}

//Resets the stage
void reset() {
  if (mapNum == 3) {
    gamer = new Player(new PVector(630, 50), 0.9, 0.7, false, "princess.png");
    gamer1 = new Player(new PVector(1234, 50), 0.9, 0.7, true, "wizard.png");
  } else {
    gamer = new Player(new PVector(100, 50), 0.9, 0.7, false, "princess.png");
    gamer1 = new Player(new PVector(1770, 50), 0.9, 0.7, true, "wizard.png");
  }
  keys=new boolean[10];
  keys = new boolean[] {false, false, false, false, false, false, false, false, false, false}; 
  minecraft = createFont("Minecraft.ttf", 32); 
  bullets = new Projectile[0];
  
  gameOver = false;
  
  //load correct map
  switch(mapNum) {
  case 1:
    map1();
    break;
  case 2:
    map2();
    break;
  case 3:
    map3();
    break;
  case 4:
    //map4();
    break;
  case 5:
    //map5();
    break;
  case 6:
    //map6();
    break;
  }
}
