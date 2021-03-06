int count = 3;
String mode = null;
int mousePos = 0;
Timer modeTime = new Timer();
Timer timeModeTimer = new Timer();
int timeRunning = 0;

//define button boundries
float timeXLeft;
float timeXRight;
float timeYLeft;
float timeYRight;

float livesXLeft;
float livesXRight;
float livesYLeft;
float livesYRight;

float plusXLeft;
float plusXRight;
float plusYLeft;
float plusYRight;

float minusXLeft;
float minusXRight;
float minusYLeft;
float minusYRight;

void modesScreen() {
  music.pause();
  music.rewind();
  
  game.fill(0, 255, 0);
  game.rect(0, 0, 1920, 1080);

  game.fill(0);
  game.textAlign(CENTER, CENTER);
  game.textFont(minecraft, 100);
  game.textSize(200);
  game.text("Modes", 960, 150);

  //check if mouse if over a button
  if (mouseX > timeXLeft && mouseX < timeXRight && mouseY > timeYLeft && mouseY < timeYRight) {
    game.fill(100);
    game.rect(220, 350, 265, 100);
    mode = "time";
    //load time mode if clicked
    if (mousePressed && modeTime.passed(1000)) {
      modes = false;
      running = true;
      if (mode == "lives") {
        p1Wins = count;
        p2Wins = count;
      } else {
        p1Wins = 0;
        p2Wins = 0;
      }
      timeModeTimer.reset();
      reset();
      music.play();
    }
  }

  game.fill(0);
  game.textSize(100);
  game.text("Time", 350, 400);

  if (mouseX > livesXLeft && mouseX < livesXRight && mouseY > livesYLeft && mouseY < livesYRight) {
    game.fill(100);
    game.rect(1435, 350, 265, 100);
    mode = "lives";
    //load lives mode if clicked
    if (mousePressed && modeTime.passed(1000)) {
      modes = false;
      running = true;
      if (mode == "lives") {
        p1Wins = count;
        p2Wins = count;
      } else {
        p1Wins = 0;
        p2Wins = 0;
      }
      reset();
      music.play();
    }
  }
  game.fill(0);
  game.text("Lives", 1570, 400);

  game.textSize(300);
  count = max(count, 0);
  game.text(str(count), 960, 750);

  //add to lives/time count
  mousePos = 0;
  if (mouseX > plusXLeft && mouseX < plusXRight && mouseY > plusYLeft && mouseY < plusYRight) {
    mousePos = 1;
  }
  game.fill(0);
  game.textSize(200);
  game.text("+", 700, 750);

  //subtract from lives/time count
  if (mouseX > minusXLeft && mouseX < minusXRight && mouseY > minusYLeft && mouseY < minusYRight) {
    mousePos = 2;
  }
  game.fill(0);
  game.text("-", 1220, 720);
}

//change count based on button clicks
void mouseClicked() {
  if (mousePos == 1) {
    count++;
  } else if (mousePos == 2) {
    count--;
  }
}
