
public class Config {

  private ArrayList<R> r;
  private int xcircle, ycircle;
  private Omtrek om;
  private int geval = 0;
  private Statements sts;

  //construct a random configuration
  public Config(Statements sts) {
    this.sts = sts;
    randomConfig();
  }

  //constructs a specified configuration
  public Config(ArrayList<R> r, int xcircle, int ycircle, Statements sts) {
    this.r =r;
    this.xcircle = xcircle;
    this.ycircle = ycircle;
    this.sts = sts;
    om = null;
  }



  //returns a random int between low and high
  public int randomBetween(int low, int high) {
    return int(random(high - low)) + low;
  }

  //constructs the random configuration
  //it choses the type of configuration
  //and then randomly generatates configurations until one of the type is found
  public void randomConfig() {
    setGeval();
    createRectangles();
    int lasVegas = 1000;
    do {
      if (lasVegas-- == 0) {
        createRectangles();
        lasVegas=1000;
      }
      randomCircle();
    } while (!(om.checkGeval(xcircle, ycircle) == geval));
  }

  public void setGeval() {
    float kans = random(1);
    if (kans<0.25) geval = 1;
    else if (kans < 0.5) geval =2;
    else if (kans < 0.75)geval = 3;
    else geval =4;
  }
  
  //places n random rectangles at random spots
  public void createRectangles() {
    r = new ArrayList<R>();

    for (int i = 0; i<n; i++) {
      // creates random values for x y and the width and heigth
      int x = randomBetween(minXY, (maxXY - maxHeigthWidth ));
      int y = randomBetween(minXY, (maxXY - maxHeigthWidth ));
      int w = randomBetween(minHeigthWidth, maxHeigthWidth);
      int h = randomBetween(minHeigthWidth, maxHeigthWidth);


      x = x - (x % mod);
      y = y - (y % mod);
      w = w - (w % mod) + (mod/2);
      h = h - (h % mod) + (mod/2);

      r.add(new R(x, y, w, h));
    }
    om = new Omtrek(r);
  }
  
  //places a circle at a random spot
  public void randomCircle() {
    xcircle = int(random((maxXY-radius)-(minXY+radius))) + (minXY+radius);
    ycircle = int(random((maxXY-radius)-(minXY+radius))) + (minXY+radius);
    xcircle = xcircle - xcircle % (mod/2) + (mod/2);
    ycircle = ycircle - ycircle % (mod/2) + (mod/2);
  }

  //propogates mouse click to it's statements
  public void mouseP() {
    sts.mouseP();
  }

  //displays the configuration
  public void display() {
    for ( R rec : r )
      rec.display();

    fill(255);
    ellipse(800, 600, radius, radius);

    textAlign(CENTER, CENTER);
    fill(0);
    text(geval, 800, 600);

    fill(255, 255, 0);
    ellipse(xcircle, ycircle, radius, radius);

    sts.displayStatement();
  }

  public String toString() {
    String s = "Configuration \n" + geval + "\n" + "Rectangles:\n";
    for (R rec : r)
      s += rec + "\n";

    s += "Circle x and y: "+ xcircle + " " + ycircle +"\n Statementss:\n" + sts + "\n \n ";
    return s;
  }
}



//class of the Rectangle
class R {
  public int x1, x2, y1, y2, w, h;
  public R(int x, int y, int w, int h) {
    this.w = w;
    this.h = h;
    x1 = x;
    x2 = x + w;
    y1 = y;
    y2 = y + h;
  }

  public void display() {
    strokeWeight(2);
    fill(57, 57, 164,200);
    stroke(0, 0, 0);
    rect(x1, y1, x2-x1, y2-y1);
  }
  public String toString() {
    return "x1: " + x1 + "; y1 : " + y1 + "; x2 : " + x2 + "; y2 : " + y2 + "; w : " + w + "; h : " + h;
  }
}