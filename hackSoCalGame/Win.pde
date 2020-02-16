boolean gameOver = false;

void winScreen(String winner){
  game.fill(0, 255, 0);
  game.rect(0, 0, 1920, 1080);
  
  game.fill(0);
  game.textFont(minecraft, 100);
  game.textAlign(CENTER, CENTER);
  game.text(winner + " Wins!", 960, 500);
  gameOver = true;
}
