
void startScreen(){
  background(0, 255, 0);
  
  fill(0);
  textFont(minecraft);
  textSize(200);
  textAlign(CENTER, CENTER);
  text("then", 940, 300);
  
  textSize(90);
  text("go back", 940, 750);
  
  if(mouseX > 750 && mouseX < 1120 && mouseY > 710 && mouseY < 820){
      stroke(0);
      strokeWeight(5);
      fill(0, 0, 0, 0);
      rect(750, 710, 370, 110);
      
      if(mousePressed){
        running = true;
      }
  }
}
