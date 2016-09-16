//handles the mousepress for buttons and questions of the current configuration

void mousePressed() {
  //propagate mouse click to configuration
  cs[currentConfig].mouseP();

  //handles mouse click for button's

  //Goes one configuration back
  if (onButton1) 
    currentConfig = currentConfig==0?0:currentConfig-1;
  //Goes one configuration forward
  if (onButton2)     
    currentConfig = currentConfig==cn-1?cn-1:currentConfig+1;
  //calls exit function
  if (onButton3 && currentConfig==cn-1) 
    startExit();
}

//Exits the program and exports the resuls
public void startExit() {
  String[] s = new String[1];
  s[0] = "";   
  for (currentConfig=0; currentConfig < cs.length; currentConfig++) {
    s[0] += "\n" + (currentConfig+1) + "\n" + cs[currentConfig] ;
    background(245, 251, 240);
    cs[currentConfig].display();
    drawButton();
    saveFrame("/output/config-"+currentConfig+".png");
  }
  saveStrings("/output/output.txt", s);
  exit(); // Stop the program
}