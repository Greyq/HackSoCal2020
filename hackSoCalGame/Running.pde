int mins = 0;

void gameLoop() {
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
      if (shape.collided(bullet.shape) && bullet.shape.on) {
        shape.fadeShape();
        shape.reduceTime(500);
        bullet.shape.removeShape();
      }
    }
    shape.drawShape();
  }
  //float amp = map(music.getVolume(), 0, 100, 1, 0 );
  //wave.setAmplitude( amp );

  //wave.setFrequency(10000);

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
    if (mode == "lives") {
      p1Wins--;
    } else {
      p2Wins++;
    }
    reset();
  }

  if (gamer1.alive == false) {
    if (mode == "lives") {
      p2Wins--;
    } else {
      p1Wins++;
    }
    reset();
  }

  if (mode == "lives") {
    if (p1Wins == 0) {
      winScreen("Player 2");
    } else if (p2Wins == 0) {
      winScreen("Player 1");
    }
  }

  if (!gameOver) {
    gamer.render();
    gamer1.render();


    game.fill(0);
    game.textFont(minecraft);
    game.textSize(100);
    game.textAlign(CENTER, CENTER);

    if (timeModeTimer.passed(1000)) {
      timeRunning -= 1;
      timeModeTimer.reset();
    }
    if (timeRunning < 0) {
      timeRunning = 59;
      mins++;
    }


    if (mapNum == 2) {
      game.text(str(p1Wins), 690, 200);
      game.text(str(p2Wins), 1270, 200);
    } else {
      game.text(str(p1Wins), 790, 200);
      game.text(str(p2Wins), 1140, 200);
    }
  }
  if (mode == "time") {
      game.text(str(count - mins) + ":" + extraZero() + str(timeRunning), 960, 300);
      if(mins == count && timeRunning == 0) winScreen(higherScore());
    }
}

String extraZero() {
  if (timeRunning < 10) {
    return "0";
  } else return "";
}

String higherScore(){
  if(p1Wins > p2Wins){
    return "Player 1";
  } else if(p2Wins > p1Wins){
    return "Player 2";
  } else {
    return "Player 1 and Player 2";
  }
}
