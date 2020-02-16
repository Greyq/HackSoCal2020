Player gamer;
Player gamer1;
boolean[] keys;
int blockCount = 20;
Shape[] blocks = new Shape[blockCount];
Projectile[] bullets = new Projectile[0];

void setup() {

  size(1920, 1080);
  gamer = new Player(new PVector(100, 50), 0.9, 1, false);
  gamer1 = new Player(new PVector(1800, 50), 0.9, 1, true);
  keys=new boolean[10];
  keys = new boolean[] {false, false, false, false, false, false, false, false, false, false}; 

  for (int i=0; i<blockCount; i++) {
    blocks[i] = new Shape(new PVector(map(i, 0, blockCount, 70, 1840), 700), new PVector(1840/blockCount, 100), color(0), true);
  }
}


void draw() {
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
        shape.reduceTime(200);
        bullet.shape.removeShape();
      }
    }
    shape.drawShape();
  }

  for (Projectile bullet : bullets) {
    if (bullet.shape.collided(gamer.shape)) {
      gamer.vel.add(bullet.velocity);
    }
    if (bullet.shape.collided(gamer1.shape)) {
      gamer1.vel.add(bullet.velocity);
    }
    bullet.render();
  }

  gamer.render();
  gamer1.render();
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
