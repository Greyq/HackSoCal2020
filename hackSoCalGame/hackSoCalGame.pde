Player player;

void setup() {
  size(1920, 1080);
  player = new Player(new PVector(100, 50), 0.9, 1);
}


void draw() {
  background(255);
  fill(0);
  rect(70, 700, 1770, 100);
  player.render();
}  
