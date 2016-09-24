//Produces the collection of non-intersecting linesegments createdthe rectangles.
//In essence produces the boundary of the polygon created by the merging of the rectangle
//When a circle intersects none of these line segments, it is either completly outside or inside the merged rectangles.
//This fact is used to check in what category a random generated configuration of a circle and rectangles falls.

class Omtrek {
  ArrayList<LSH> omtrek;
  ArrayList<LSH> hls;
  ArrayList<LSH> vls;
  ArrayList<R> r;

  public Omtrek(ArrayList<R> r) {
    this.r = r;
    omtrekMaken();
  }

  public int checkGeval(int xcircle, int ycircle) {
    if (circleInRec(xcircle, ycircle))          return 1;// in een
    else if (omtrekIntersect(xcircle, ycircle)) return 2;// op de rand
    else if (circleInRecPlus(xcircle, ycircle)) return 3;// in meerdere
    else                                        return 4;// helemaal er buiten
  }

  //returns true if the circle is inside one rectangle
  public boolean circleInRec(int xcircle, int ycircle) {
    for (R rec : r) {
      if (xcircle-(radius) > rec.x1 && xcircle+(radius) < rec.x2 && ycircle-(radius) > rec.y1 && ycircle+(radius) < rec.y2)
        return true;
    }
    return false;
  }

  //returns true if the circle intersects with the non-intersecting linesegments
  public boolean omtrekIntersect(int xcircle, int ycircle) {
    for (LSH line : omtrek) 
      if (circleLineIntersect(line.x1, line.y1, line.x2, line.y2, xcircle, ycircle, radius)) return true;
    return false;
  }

  //returns true if it intersects a linesegment that intersects another rectanles 
  public boolean circleInRecPlus(int xcircle, int ycircle) {
    for (LSH line : hls) 
      if (circleLineIntersect(line.x1, line.y1, line.x2, line.y2, xcircle, ycircle, radius)) return true;
    for (LSH line : vls) 
      if (circleLineIntersect(line.x1, line.y1, line.x2, line.y2, xcircle, ycircle, radius)) return true;
    return false;
  }

  //produces the non intersecting linesegments
  public void omtrekMaken() {
    omtrek= new ArrayList<LSH>();
    hls = new ArrayList<LSH>();
    vls = new ArrayList<LSH>();
    for (R rec : r) {
      hls.add(new LSH(rec.x1, rec.x2, rec.y1, rec.y1));
      hls.add(new LSH(rec.x1, rec.x2, rec.y2, rec.y2));
      vls.add(new LSH(rec.x1, rec.x1, rec.y1, rec.y2));
      vls.add(new LSH(rec.x2, rec.x2, rec.y1, rec.y2));
    }
    for (LSH line : hls)intersectH(line);
    for (LSH line : vls)intersectV(line);
  }

  //adds all horizontal linesegements that don't intersect another rectangle
  public void intersectH(LSH line) {

    int x1 = line.x1, y = line.y1, x2 = line.x2;
    for (LSH line2 : vls) {
      int x = line2.x1, y1 = line2.y1, y2 = line2.y2;
      if (y > y1 && y < y2 && x > x1 && x < x2)
      {
        intersectH(new LSH(x1, x, y, y));
        intersectH(new LSH(x, x2, y, y)); 
        return;
      }
    }
    for (R rec : r) {
      if ((rec.x1 < x1 && rec.x2 > x1 && rec.y1 < y && rec.y2 > y) || (rec.x1 < x2 && rec.x2 > x2 && rec.y1 < y && rec.y2 > y))return;
      if (rec.x1 == x1 && rec.x2 == x2 && (rec.y1 < y) && (rec.y2 > y)) return;
    }
    omtrek.add(line);
  }

  //adds all vertical linesegements that don't intersect another rectangle
  public void intersectV(LSH line) {
    int x = line.x1, y1 = line.y1, y2 = line.y2;
    for (LSH line2 : hls) {
      int x1 = line2.x1, x2 = line2.x2, y = line2.y1;
      if (y > y1 && y < y2 && x > x1 && x < x2)
      {
        intersectV(new LSH(x, x, y1, y));
        intersectV(new LSH(x, x, y, y2)); 
        return;
      }
    }
    for (R rec : r) {
      if ((rec.x1 < x && rec.x2 > x && rec.y1 < y1 && rec.y2 > y1) || (rec.x1 < x && rec.x2 > x && rec.y1 < y2 && rec.y2 > y2))return;
      if (rec.y1 == y1 && rec.y2 == y2 && (rec.x1 < x) && (rec.x2 > x)) return;
    }
    omtrek.add(line);
  }
}

//class of the linesegment


class LSH {
  public int x1, x2, y1, y2;
  public LSH(int x1, int x2, int y1, int y2) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }

//display function is for debugging
  public void display() {
    fill(0);
    stroke(0);
    strokeWeight(5);
    line(x1, y1, x2, y2);
    stroke(0, 255, 0);
    strokeWeight(10);
    point(x1, y1);
    point(x2, y2);
    strokeWeight(1);
  }
}