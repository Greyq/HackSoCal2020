
void startScreen(){
  music.pause();
  music.rewind();
  
  game.fill(0, 255, 0);
  game.rect(0, 0, 1920, 1080);
  
  game.fill(0);
  game.textFont(minecraft);
  game.textSize(200);
  game.textAlign(CENTER, CENTER);
  game.text("then", 940, 300);
  
  game.textSize(90);
  game.text("go back", 940, 750);
  
  //check if mouse is over start button
  if(mouseX > xLeftBound && mouseX < xRightBound && mouseY > yLeftBound && mouseY < yRightBound){
      game.stroke(0);
      game.strokeWeight(5);
      game.fill(0, 0, 0, 0);
      game.rect(750, 710, 370, 110);
      
      //go to map screen if button pressed
      if(mousePressed){
        mapSelect = true;
        mapTime.reset();
      }
  }
}
