

//the class of the statement
  class Statement {
    boolean p = false;
    boolean onTrue = false, onFalse = true;
    String s;
    int x, y, b1x, b1y, b2x, b2y; 
    int bw = 100;
    int bh = 50;
    int spacingButton = 10;
    int distText2Button = 50;

    public Statement (String s) {
      this.s = s;
      x = 600;
      y= 500;
      b1x = x;
      b1y = y + distText2Button;
      b2x = x + bw + spacingButton;
      b2y = y + distText2Button;
    }

    public void display() {

      textAlign(LEFT, TOP); 
      textSize(25); 
      fill(0);
      text(s, x, y+10);

      textSize(20);
      fill(p?155:(onTrue?200:255));
      rect(b1x, b1y, bw, bh);
      fill(!p?155:(onFalse?200:255));
      rect(b2x, b2y, bw, bh);

      textAlign(CENTER, CENTER); 
      fill(0);
      text("True", b1x+(bw/2), b1y+(bh/2));
      text("False", b2x+(bw/2), b2y+(bh/2));
    }

    public void update() {
      onTrue = (mouseX > b1x && mouseX < b1x+bw && mouseY > b1y && mouseY < b1y + bh);
      onFalse = (mouseX > b2x && mouseX < b2x+bw && mouseY > b2y && mouseY < b2y + bh);
    }
    
    public void mouseP() {
      if (onTrue) p = true;
      if (onFalse) p = false;
    }
    public String toString() {
      return s + " " + p + "\n";
    }
  }