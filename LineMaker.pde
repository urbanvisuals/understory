


List Xloc;

int [] xl;


void LoadLines() {
  String linesarray[] = loadStrings("lines.txt");
  xl = new int[linesarray.length];

  for (int i=0; i< linesarray.length; i++) {
    xl[i] = Integer.parseInt(linesarray[i]);
  }
}


void LineMaker_setup() {
  Xloc = new ArrayList(); 
  Xloc.add(new Integer(0));
}

void LineMaker_draw() {
  colorMode(HSB, 100);
  background(0);




  for (int i = Xloc.size ()-1; i >= 0; i--) {

    strokeWeight(10);
    stroke(40, 0, 0);
    line((Integer)(Xloc.get(i)), 0, (Integer)(Xloc.get(i)), 600);

    if (i< Xloc.size()-1) {
      // strokeWeight(1);
      fill((i*7)%100, 100, 100);
      rect((Integer)(Xloc.get(i)), 0, (Integer)(Xloc.get(i+1))- (Integer)(Xloc.get(i)), 600);

      textSize(30);
      fill(0, 0, 0);
      text(i, ((Integer)(Xloc.get(i))+(Integer)(Xloc.get(i+1)))/2 - 20, 300 );
    }
  }


  strokeWeight(10);
  stroke(100, 0, 100);
  line(mouseX, 0, mouseX, 600);


  strokeWeight(1);
}



class intComparator implements Comparator {
  int compare(Object o1, Object o2) {
    int i1 = (Integer) o1;
    int i2 = (Integer) o2;
    if (i1 < i2)
      return -1;
    else if (i1 == i2)
      return 0;
    else
      return 1;
  }
}

Scene lineMaker = new Scene("linemaker", "Line Maker") {
  void setup() { LineMaker_setup(); }
  void draw() { LineMaker_draw(); }
};

void mousePressed() {

  if (scene == lineMaker) {
    Xloc.add(new Integer(mouseX));
    Collections.sort(Xloc);

    String [] Positions = new String[Xloc.size()];
    for (int i=0; i< Xloc.size (); i++) {
      Positions[i] = ""+Xloc.get(i);
    }
    saveStrings("lines.txt", Positions);
  }
}

