int mapNum = 0;

PImage map1;
PImage map2;
PImage map3;
PImage map4;
PImage map5;
PImage map6;

float map1XLeft;
float map1XRight;
float map1YLeft;
float map1YRight;

float map2XLeft;
float map2XRight;
float map2YLeft;
float map2YRight;

float map3XLeft;
float map3XRight;
float map3YLeft;
float map3YRight;

float map4XLeft;
float map4XRight;
float map4YLeft;
float map4YRight;

float map5XLeft;
float map5XRight;
float map5YLeft;
float map5YRight;

float map6XLeft;
float map6XRight;
float map6YLeft;
float map6YRight;
Timer mapTime = new Timer();

void mapScreen() {
  game.fill(0, 255, 0);
  game.rect(0, 0, 1920, 1080);

  game.fill(0);
  game.textFont(minecraft, 100);
  game.textAlign(CENTER, CENTER);
  game.text("Map Select", 960, 100);

  if (mouseX > map1XLeft && mouseX < map1XRight && mouseY > map1YLeft && mouseY < map1YRight) {
    game.tint(200);
    mapNum = 1;
  } else game.noTint();

  game.image(map1, 84, 300);
  
  game.noTint();
  
  if (mouseX > map2XLeft && mouseX < map2XRight && mouseY > map2YLeft && mouseY < map2YRight) {
    game.tint(200);
    mapNum = 2;
  } else game.noTint();
  game.image(map2, 960 - 1920/8, 300);

  game.noTint();
  
  if (mouseX > map3XLeft && mouseX < map3XRight && mouseY > map3YLeft && mouseY < map3YRight) {
    game.tint(200);
    mapNum = 3;
  } else game.noTint();
  game.image(map3, 1352, 300);
  
  game.noTint();
  
  if (mouseX > map4XLeft && mouseX < map4XRight && mouseY > map4YLeft && mouseY < map4YRight) {
    game.tint(200);
    mapNum = 4;
  } else game.noTint();
  game.image(map4, 84, 700);
  
  game.noTint();
  
  if (mouseX > map5XLeft && mouseX < map5XRight && mouseY > map5YLeft && mouseY < map5YRight) {
    game.tint(200);
    mapNum = 5;
  } else game.noTint();
  game.image(map5, 960 - 1920/8, 700);
  
  game.noTint();
  
  if (mouseX > map6XLeft && mouseX < map6XRight && mouseY > map6YLeft && mouseY < map6YRight) {
    game.tint(200);
    mapNum = 6;
  } else game.noTint();
  game.image(map6, 1352, 700);

  
  if(mousePressed && mapNum != 0 && mapTime.passed(500)){
    modes = true;
    mapSelect = false;
  }
}
