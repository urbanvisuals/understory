
void spinners_setup() {
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);

  fill(0, 0, 0);

  for (int i=0; i< 2400/300 + 1; i++) {
    FCircle b = new FCircle(1);
    b.setPosition(i*300, 600);
    b.setRotation(random(360)); 
    b.setVelocity(0, 0);
    b.setAngularVelocity(random(-1, 1)); 
    b. setAngularDamping(0);
    world.add(b);
  }
}

void spinners_draw() {
  colorMode(HSB, 100);
  background(0);


  ArrayList BodyList = world.getBodies();
  FCircle present;


  for (int i=0; i< BodyList.size (); i++) {
    if (BodyList.get(i) instanceof FCircle) {
      present = (FCircle)BodyList.get(i);


      pushMatrix();

      translate(present.getX(), present.getY()); 

      rotateZ(present.getRotation());
      rotateX(present.getRotation()/20);
      rotateY(present.getRotation()/45);

      stroke(0, 0, 255);
      fill((present.getX()/5)%100, 25, 100);
      strokeWeight(fader1);

      rect(-350, -350, 700, 700);

      popMatrix();
      //    print("Drawing circle" + present.getY() + "/n");
    }
  }


  world.step();
}




void spinners2_setup() {

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);


  fill(0, 0, 0);



  for (int i=0; i< 2400/300 + 1; i++) {
    FCircle b = new FCircle(1);
    b.setPosition(i*300, 600);
    b.setRotation(random(360)); 
    b.setVelocity(0, 0);
    b.setAngularVelocity(random(-1, 1)); 
    b. setAngularDamping(0);
    world.add(b);
  }
}

void spinners2_draw() {
  colorMode(RGB, 255);
  background(0);


  ArrayList BodyList = world.getBodies();
  FCircle present;


  for (int i=0; i< BodyList.size (); i++) {
    if (BodyList.get(i) instanceof FCircle) {
      present = (FCircle)BodyList.get(i);


      pushMatrix();

      translate(present.getX(), present.getY()); 

      rotateZ(present.getRotation());


      stroke(fader2);
      fill(fader4, fader5, fader6, 20);
      strokeWeight(fader1);

      rect(-425, -425, 850, 850);

      popMatrix();
      //    print("Drawing circle" + present.getY() + "/n");
    }
  }

  world.step();
}

Scene spinners = new Scene("spinners", "Spinners") {
  void setup() {spinners_setup();}
  void draw() {spinners_draw();}
};

