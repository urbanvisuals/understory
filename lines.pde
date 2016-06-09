
void lines_setup() {
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);


  fill(0, 0, 0);
}

void lines_draw() {
  colorMode(HSB, 100);

  background(0);

  if ((frameCount % fader2) == 1) {



    FCircle b = new FCircle(1);

    switch((int)random(6)) { // move to the right
    case 0:
    case 1:
      b.setVelocity(20+random(fader3), 0);
      b.setPosition(0, random(600)); 
      break;
    case 2:
    case 3:
      b.setVelocity(-20-random(fader3), 0);
      b.setPosition(2400, random(600)); 

      break;
    case 4:
      b.setVelocity(0, 5+random(fader3/4));
      b.setPosition(random(2400), 0);
      break;
    case 5:

      b.setVelocity(0, -5-random(fader3/4));
      b.setPosition(random(2400), 600);

      break;
    }


    b.setStatic(false); 
    b.setStaticBody(false);


    b.setStroke(255, 255, 255);
    b.setFill(0, 0, 0, 10);

    b.setRotation(0); 

    b.setAngularVelocity(0); 

    b.setDamping(0);
    b.setFriction(0);
    b.setRestitution(0);


    world.add(b);
  }

  strokeWeight(0);
  fill(0, 0, 255);
  ArrayList BodyList = world.getBodies();
  FCircle present;
  for (int i=0; i< BodyList.size (); i++) {
    if (BodyList.get(i) instanceof FCircle) {
      present = (FCircle)BodyList.get(i);

      if (present.getVelocityX() != 0) {
        rect(present.getX(), 0, fader1, 600);
      } else {
        rect(0, present.getY(), 2400, fader1);
      }



      if (present.getY()< 0 || present.getX()>2400 || present.getX() < 0 || present.getY() > 2400)
        world.remove(       (FBody)BodyList.get(i)      );
      //    ellipse(present.getX(),present.getY(),20,20);
    }
  }


  //remover.setSensor(1);
  world.step();
  // world.draw();
}

Scene lines = new Scene("lines", "Lines") {
  void setup() {lines_setup();}
  void draw() {lines_draw();}
};

