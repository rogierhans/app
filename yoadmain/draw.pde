void draw() {
  //draws background
  background(245, 251, 240); 
  //draws the current configuration
  cs[currentConfig].display();
  //draws the three buttons on the bottem
  drawButton();
  //displayLine();
  ////for debuging
  //line(0,maxXY,width,maxXY);
  //line(maxXY,0,maxXY,height);
  //line(0,maxXY-maxHeigthWidth,width,maxXY-maxHeigthWidth);
  //line(maxXY-maxHeigthWidth,0,maxXY-maxHeigthWidth,height);
}


//for debuging
public void displayLine() {
    strokeWeight(2);
    for (LSH line : cs[currentConfig].om.omtrek)line.display();

}