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
    p2Wins++;
    reset();
  }

  if (gamer1.alive == false) {
    p1Wins++;
    reset();
  }
  
  //game.stroke(255);
  //game.strokeWeight(1);
  
  //for(int i = 0; i < out.bufferSize() - 1; i++){
  //  game.line( i, 50  - out.left.get(i)*50,  i+1, 50  - out.left.get(i+1)*50 );
  //  game.line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
  //}
  gamer.render();
  gamer1.render();

  game.fill(0);
  game.textFont(minecraft);
  game.textSize(100);
  game.textAlign(CENTER, CENTER);
  if (mapNum == 2) {
    game.text(str(p1Wins), 690, 200);
    game.text(str(p2Wins), 1270, 200);
  } else {
    game.text(str(p1Wins), 790, 200);
    game.text(str(p2Wins), 1140, 200);
  }
}
