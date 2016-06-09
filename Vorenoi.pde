
void Vorenoi_setup() {
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);



  FCircle b;
  for (int i=0; i< 125; i++) {

    b = new FCircle(50);


    b.setDrawable(false);
    b.setPosition(random(2400), random(600));
    b.setStroke(0);
    b.setStrokeWeight(0);
    b.setFill(255);
    b.setDamping(0);
    b.setFriction(0);
    b.setRestitution(1);
    b.setVelocity(random(-100, 100), random(-100, 100));
    world.add(b);
  }
}

void Vorenoi_draw() {
  colorMode(HSB, 100);
  background(0);

  ArrayList BodyList = world.getBodies();

  int alength = BodyList.size();
  float[][] points = new float[alength][2];

  FBody present;
  int k = 0;
  int m = 0;

  for (int i=0; i < BodyList.size (); i++) {
    present = (FBody)BodyList.get(i);


    if (present instanceof FCircle) {//ball

      if (present.getX() < 0) {
        present.setPosition(0, present.getY());
        present.setVelocity(-present.getVelocityX(), present.getVelocityY());
      }


      if (present.getX() > 2400) {
        present.setPosition(2400, present.getY());
        present.setVelocity(-present.getVelocityX(), present.getVelocityY());
      }


      if (present.getY() < 0) {
        present. setPosition(present.getX(), 0);
        present.setVelocity(present.getVelocityX(), -present.getVelocityY());
      }

      if (present.getY() > 600) {
        present. setPosition(present.getX(), 600);
        present.setVelocity(present.getVelocityX(), -present.getVelocityY());
      }

      points[m][0] = present.getX()+i;
      points[m][1] = present.getY()+i;
      m++;
    }
  }



  try {
    Voronoi myVoronoi = new Voronoi( points );


    MPolygon[] myRegions = myVoronoi.getRegions();


    stroke(100, 0, 0);
    strokeWeight(fader1/4);
    fill(0, 0, 0);
    for (int i=0; i<myRegions.length; i++)
    {
      // an array of points
      float[][] regionCoordinates = myRegions[i].getCoords();

      if (i%10 != 1)
        fill((i*7)%100, fader4/2.55f, 100);
      else
        fill(0, 0, 0);

      myRegions[i].draw(this); // draw this shape
      fill(0, 0, 0);

      //   textSize(18); 

      //   text((i+1), points[i][0]-20, points[i][1]-0);
    }
  }  
  catch (Exception e) {
    e.printStackTrace();
  }

  world.step();
  world.draw();
  //println(world.getBodies());
}

Scene vorenoi = new Scene("voronoi", "Voronoi") { // [sic], it's Voronoi.
  void setup() {Vorenoi_setup();}
  void draw() {Vorenoi_draw();}
};

