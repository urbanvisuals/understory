void Delauney_setup() {

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);



  FCircle b;
  for (int i=0; i< 50; i++) {

    b = new FCircle(5);


    b.setDrawable(false);
    b.setPosition(random(2400), 1);
    b.setStroke(0);
    b.setStrokeWeight(0);
    b.setFill(255);
    b.setDamping(0);
    b.setFriction(0);
    b.setRestitution(1);
    b.setVelocity(random(-100, 100), random(-100, 100));
    world.add(b);
  }


  //remover = new FBox(2068, 20);
  //remover.setPosition(1024, height+40);
  //remover.setStatic(true);
  //remover.setFill(0);
  //remover.setRestitution(0);
  //world.add(remover);
}

void Delauney_draw() {
  colorMode(HSB, 100);

  background(0);




  ArrayList BodyList = world.getBodies();

  //for(int i=0; i< BodyList.size(); i++){
  // if(((FBody)BodyList.get(i)).getY() > 1500){
  //      world.remove((FBody)BodyList.get(i));
  // }

  // if(((FBody)BodyList.get(i)).getY() == 0){
  //     world.remove((FBody)BodyList.get(i));
  //}

  //}


  //  BodyList = world.getBodies();

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
    Delaunay myDelaunay = new Delaunay( points );


    float[][] myEdges = myDelaunay.getEdges();

    strokeWeight(6);

    for (int i=0; i<myEdges.length; i++)
    {
      float startX = myEdges[i][0];
      float startY = myEdges[i][1];
      float endX = myEdges[i][2];
      float endY = myEdges[i][3];
      //stroke(i%3,255,255);

      //stroke((abs(endX-startX))%100,100,100);
      //noFill();
      noStroke();
      fill(abs(endX-startX)%100, fader4/2.55f, fader5/2.55f);
      //  alpha(10);
      rect((endX+startX)/2 - abs(endX-startX)/2, (endY+startY)-abs(endY-startY)/2, abs(endX-startX), abs(endY-startY));

      //line( startX, startY, endX, endY );
    }
  }  
  catch (Exception e) {
    e.printStackTrace();
  }


  world.step();
  strokeWeight(3);
  world.draw();
  //println(world.getBodies());
}

Scene delauney = new Scene("delaunay", "Delaunay") {
  void setup() {
    Delauney_setup();
  }
  void draw() {
    Delauney_draw();
  }
};