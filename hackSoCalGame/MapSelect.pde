
void mapScreen(){
  game.fill(0, 255, 0);
  game.rect(0, 0, 1920, 1080);
  
  game.fill(0);
  game.textFont(minecraft, 100);
  game.textAlign(CENTER, CENTER);
  game.text("Map Select", 960, 100);
  
  game.rect(84, 300, 1920/4, 1080/4);
  game.rect(960 - 1920/8, 300, 1920/4, 1080/4);
  game.rect(1352, 300, 1920/4, 1080/4);
  
  game.rect(84, 700, 1920/4, 1080/4);
  game.rect(960 - 1920/8, 700, 1920/4, 1080/4);
  game.rect(1352, 700, 1920/4, 1080/4);
}
