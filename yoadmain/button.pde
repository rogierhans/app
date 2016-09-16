//Draws the 3 large buttons and updates wheter or not the mouse is on the buttons with booleans

int bw = 180, bh = 70;
int b1x = 20, b1y = 620, b2x = b1x + bw, b2y = b1y, b3x = b2x +bw, b3y = b2y;
boolean onButton1 = false, onButton2 = false, onButton3=false;

public void drawButton() {
  updateMouse();
  textAlign(CENTER, CENTER);
  stroke(0);
  fill(onButton1?200:250);
  rect(b1x, b1y, bw, bh);
  fill(onButton2?200:250);
  rect(b2x, b2y, bw, bh);
  fill(onButton3&&currentConfig == cn-1?200:250);
  rect(b3x, b3y, bw, bh);
  
  textSize(30);
  fill(0);
  text("Previous", b1x+(bw/2), b1y+(bh/2));
  text("Next", b2x+(bw/2), b2y+(bh/2));
  
  fill(currentConfig == cn-1?0: 180);
  textSize(20);
  text("Export and Exit", b3x+(bw/2), b3y+(bh/2));
  fill(0);
  textAlign(LEFT,CENTER);
  textSize(50);
  text((currentConfig+1)+"/"+cn,b2x+bw+bw+20,b2y+(bh/2));
}
public void updateMouse() {
  onButton1 = (mouseX > b1x && mouseX < b1x+bw && mouseY > b1y && mouseY < b1y + bh);
  onButton2 = (mouseX > b2x && mouseX < b2x+bw && mouseY > b2y && mouseY < b2y + bh);
  onButton3 = (mouseX > b3x && mouseX < b3x+bw && mouseY > b3y && mouseY < b3y + bh);
}