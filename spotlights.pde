
void spotlights_setup() {
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);
  //snowflake = loadImage ("snowflake_small.png");

  //buildRemover();
}

void spotlights_draw() {
  colorMode(RGB, 255);
  background(0);

  if ((frameCount % fader2) == 1) {
    FCircle b = new FCircle(random(20, 40));


    if (random(2)<1) {

      b.setPosition(2400, random(600));
      b.setVelocity(random(-500), random(-200, 200));

      //b.setStroke(255,random(255),255);
      b.setFill(255, 255, 255);
    } else {
      b.setPosition(-60, random(600));
      // b.setStroke(255,255,random(255),60);
      b.setFill(255, 255, 255);

      b.setVelocity(random(500), random(-200, 200));
    }





    b.setRotation(random(2*PI)); 
    b.setAngularVelocity(random(1, -1)); 

    b.setDamping(0.1);
    b.setFriction(0.1);
    b.setRestitution(1);


    b.setStrokeWeight(fader1);

    b.setNoStroke();
    world.add(b);
  }

  fill(255, 255, 255);

  ArrayList BodyList = world.getBodies();
  // FCircle present;
  fill(255, 255, 255);
  for (int i=0; i< BodyList.size (); i++) {
    if (BodyList.get(i) instanceof FCircle) {

      ellipse(((FBody)(BodyList.get(i))).getX(), ((FBody)(BodyList.get(i))).getY(), 10, 10);

      if (((FBody)(BodyList.get(i))).getY()<-0 || ((FBody)(BodyList.get(i))).getY()>600) {
        world.remove( (FBody)BodyList.get(i));
      }
    }
  }


  //remover.setSensor(1);
  world.step();
  world.draw();
  //println(world.getBodies());
}

Scene spotlights = new Scene("spotlights", "Spotlights") {
  void setup() {
    spotlights_setup();
  }
  void draw() {
    spotlights_draw();
  }
};