//number of rectangles
int n = 5;

//min and max of x and y coordinate of the upper left and lower right corner of the random generated rectangles
int minXY = 10;
int maxXY = 600;

//min and max heigth and width of the rectangles
int maxHeigthWidth = 200;
int minHeigthWidth = 80;

//number of configurations
int cn = 20;

//the indexation of the predetermined configuration
int l1 = 10;
int l2 = 15;

int mod = 8;
int radius = 28;
Config[] cs = new Config[cn];
int currentConfig = 0;
void setup() {
  frameRate(20);
  ellipseMode(RADIUS);

  size(1000, 700);
  for ( int i =0; i< cn; i++  ) {
    if (i==l1-1) 
      cs[i] = L1();
    else if (i==l2-1) 
      cs[i] = L2();
    else {
      String ss = "The circle is in the rectangles";
      cs[i] = new Config(new Statement(ss));
    }
  }
}

//predetermined configuration
public Config L1() {
  ArrayList<R> r = new ArrayList<R>();
  R[] arrayR = {
    new R(50, 50, 255, 150), 
    new R(300, 100, 155, 300), 
    new R(450, 50, 100, 150), 
    new R(150, 400, 100, 100), 
    new R(450, 450, 80, 100),
    new R(100, 250, 100,100),
    new R(100, 250, 100,100),
    new R(100, 250, 100,100)
  };
  for (int i =0; i<n; i++)
    r.add(arrayR[i]);
  String ss = "The circle is in the rectangles";
  Statement Statements = new Statement(ss);
  return new Config(r, 300, 150, Statements);
}

//predetermined configuration
public Config L2() {
  ArrayList<R> r = new ArrayList<R>();
    R[] arrayR = {
  new R(50, 50, 150, 255),
  new R(100, 300, 300, 155),
  new R(50, 450, 150, 100),
  new R(400, 150, 100, 100),
  new R(450, 450, 80, 100),
  new R( 250, 100, 100,100),
  new R( 250, 100, 100,100),
  new R( 250, 100, 100,100)
  };
  for (int i =0; i<n; i++)
    r.add(arrayR[i]);
  String ss = "The circle is in a rectangle";
  Statement qs = new Statement(ss);
  return new Config(r, 150, 300, qs);
}