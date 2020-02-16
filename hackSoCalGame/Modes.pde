int count = 3;


void modesScreen(){
  game.fill(0, 255, 0);
  game.rect(0, 0, 1920, 1080);
  
  game.fill(0);
  game.textAlign(CENTER, CENTER);
  game.textFont(minecraft, 100);
  game.textSize(200);
  game.text("Modes", 960, 150);
  
  game.textSize(100);
  game.text("Time", 350, 400);
  game.text("Lives", 1570, 400);
  
  game.textSize(300);
  game.text(str(count), 960, 750);
  
  game.textSize(200);
  game.text("+", 700, 750);
  game.text("-", 1220, 720);
}
