void snow_down_setup() {


  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 100);
  //snowflake = loadImage ("snowflake_small.png");

  //buildRemover();


  FLine b = new FLine(0, 370, 2400, 370);


  world.add(b);

  //  b = new FLine(2400,600,2400,0);
  //    world.add(b);
}

void snow_down_draw() {
  colorMode(RGB, 255);
  background(0);

  if ((frameCount % fader2) == 1) {
    FCircle b = new FCircle(random(1+fader1, 20+fader1));



    b.setPosition(normX*width, -50);
    b.setStroke(0);
    //b.attachImage(snowflake);
    //b.setRestitution(1);
    b.setStrokeWeight(0);
    b.setFill(255, 255, 255);
    b.setVelocity(random(-5, 5), random(-5, 5));
    world.add(b);
  }


  ArrayList BodyList = world.getBodies();
  // FCircle present;
  for (int i=0; i< BodyList.size (); i++) {
    if (BodyList.get(i) instanceof FCircle) {
      if (((FBody)(BodyList.get(i))).getX()>=2500 || ((FBody)(BodyList.get(i))).getX()<=-100)
        world.remove(       (FBody)BodyList.get(i)      );
    }
  }


  //remover.setSensor(1);
  world.step();
  world.draw();
  //println(world.getBodies());
};




void cubesDownSetup() {
   colorMode(HSB, 100);
      
   circleCount = 100;
   hole = 100;
   topMargin = 50;
   bottomMargin = 300;
   sideMargin = 100;
   xPos = 0;
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(fader2, fader3);

  //MakeWorldWindows(1,100,100,100,3);


  remover = new FBox(2400, 20);
  remover.setPosition(1200, height+100);
  remover.setStatic(true);
  remover.setFill(0);
  remover.setRestitution(0);
  world.add(remover);
  
  catcher = new FBox(2400, 20);
  catcher.setPosition(1200, 370);
  catcher.setStatic(true);
  catcher.setFill(0);
  //catcher.setFriction(4);
  world.add(catcher);


}

void cubesDownDraw() {
  world.setGravity(fader2, fader3);
  background(0);

  if ((frameCount % 4) == 1) {
    FCircle b = new FCircle(random(15,100));
    float s = random(30, 40);
    float space = (width-sideMargin*2-s);
    xPos = (xPos + random(s, space/2)) % space;
    b.setPosition(sideMargin + xPos+s/2, -50);
    b.setStroke(0);
   // b.setBullet(true);
    
    b.setAngularVelocity(random(-10,10)); 
    b.setStrokeWeight(0);
    b.setFill(255);
    b.setDrawable(false);
    world.add(b);
  }
  
  stroke(100,0,100);
    strokeWeight(3);
    
       

    pointLight(0, 0, 100, 1024, 300, -100);
    ambientLight(0, 0, 75);


    //pointLight(255, 0, 0, 0, 0, -100);
     
    //pointLight(0, 255, 0, 2048, 0, -100);
      
    //pointLight(0, 0, 255, 2048, 768, -100);
       
    //pointLight(255, 0, 255, 0, 768, -100);



    ArrayList BodyList = world.getBodies();
  FCircle present;
  for(int i=0; i< BodyList.size(); i++){
    if(BodyList.get(i) instanceof FCircle){
        present = (FCircle)BodyList.get(i);
        
        //fill((i%3)*128,(i%2)*255,(i%4)*75);
        fill((present.getSize()*17)%100,100,100);
        
        
        pushMatrix();
        translate(present.getX(), present.getY(), 0); 
        rotateX(present.getRotation());
        
        rotateY(present.getRotation()/2);
        
          rotateZ(present.getRotation()/3);
          
        box(present.getSize()/1.5);
        popMatrix() ;

    }    
  }
    








  world.step();
//  world.draw();

}



Scene snowDown = new Scene("snowdown", "Snow down") {
  void setup() {
    snow_down_setup();
  }
  void draw() {
    snow_down_draw();
  }
};


Scene cubesDown = new Scene("cubesdown", "Falling cubes") {
  void setup() {
    cubesDownSetup();
  }
  void draw() {
    cubesDownDraw();
  }
};

