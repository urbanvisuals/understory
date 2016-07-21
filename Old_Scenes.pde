//
//  Vorenoi
//

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

//
// Snowdown
//
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


//
// CubesDown 
//

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

//
// Conway
// 


int Conway_width = 80;
int Conway_height = 20;

//int Conway_width = 80;
//int Conway_height = 35;


int RectWidth = 1+ 2400/ Conway_width;
int RectHeight = 1+ 600/ Conway_height;



boolean[][] ConwayGrid = new boolean[Conway_width][Conway_height];
boolean[][] ConwayGrid_new = new boolean[Conway_width][Conway_height];
boolean[][] AllwaysAlive = new boolean[Conway_width][Conway_height];




void Populate() {
  for (int x=0; x< Conway_width; x++)
    for (int y=0; y< Conway_height; y++) {
      ConwayGrid[x][y] = random(10)<2;

      //if(PointInRect(WindowLocs[]) ){
      //AllwaysAlive[x][y] = random(20)<2;

      //}
    }
}

void conway_setup() {

  ellipseMode(CENTER);




  Populate();



  noStroke();
  // strokeWeight(2);
  // stroke(0,0,255);
}


int GetNcount(int x, int y) {
  int output = 0;


  if (x< Conway_width-1) {  //right

    if (ConwayGrid[x+1][y])
      output++;

    if (y< Conway_height-1 && ConwayGrid[x+1][y+1]) //bottom right
      output++;  

    if (y>0                 && ConwayGrid[x+1][y-1])//top right
      output++;
  }

  if (x>0             ) { //left
    if (ConwayGrid[x-1][y] )
      output++;

    if (y< Conway_height-1 && ConwayGrid[x-1][y+1]) //bottom left
      output++;  

    if (y>0                 && ConwayGrid[x-1][y-1] )//top left
      output++;
  }


  if (y< Conway_height-1 && ConwayGrid[x][y+1]) //bottom
    output++;  

  if (y>0 && ConwayGrid[x][y-1] )//top
    output++;  


  return output;
}

void conway_draw() {

  int x, y, n;
  colorMode(HSB, 100);
  background(0);



  //strokeWeight(1);
  //stroke(0,0,0);



  for (x=0; x< Conway_width; x++) {
    for (y=0; y< Conway_height; y++) {


      if (frameCount %fader2 == 1) {
        if (AllwaysAlive[x][y]) {
          n = 10;  
          ConwayGrid_new[x][y] = true;
        } else {

          n = GetNcount(x, y);
          if (ConwayGrid[x][y]) {
            if (n<2 || n>3)
              ConwayGrid_new[x][y] = false;
            //else
            //  ConwayGrid_new[x][y] = true;
          } else {//DEAD
            if (n==3)
              ConwayGrid_new[x][y] = true;
            // else
            //  ConwayGrid_new[x][y] = false;
          }
        }
      }
      if (ConwayGrid_new[x][y]) {
        fill(x%100, fader4/2.55f, 100);
        //  else
        //   fill(0,0,0);


        rect(RectWidth*x, RectHeight*y, RectWidth, RectHeight);

        /*
        pushMatrix();
         translate(RectWidth*x,RectHeight*y,0); 
         
         
         
         box(RectWidth-2,RectHeight-2,(RectWidth/3)*n);
         popMatrix() ;
         */
      }
    }
  }  

  boolean empty = true;

  for (x=0; x< Conway_width; x++) {
    for (y=0; y< Conway_height; y++) {
      ConwayGrid[x][y] = ConwayGrid_new[x][y];
      if (ConwayGrid[x][y])
        empty = false;
    }
  }

  if (empty)
    Populate();

  ConwayGrid[(int)random(Conway_width)][(int)random(Conway_height)] = true;
}

Scene conway = new Scene("conway", "9: Conway's game o life") {
  void setup() {
    conway_setup();
  }
  void draw() {
    conway_draw();
  }
};

//
// lines
//



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



//
//  Spinners
//

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



//
//  Spotlights
//

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


//
// Stripes
//

void stripes_setup() {
  smooth();
  ellipseMode(CENTER);
}

int ColorCode = 0;
float Stripe_Offset = 0;
float Window_Offset = 0;
int WindowCode = 0;

void stripes_draw() {
  int Stripe_Width = fader1;
  colorMode(HSB, 100);
  background(0);
  PVector v0;

  strokeWeight(3);
  stroke(0, 0, 0);



  for (int i=-1; i< 2400/Stripe_Width; i++) {

    if (abs(i-ColorCode)%2 == 0) {
      fill(((abs(i-ColorCode)*10))%100, 25, 100);
    } else {
      fill(0, 0, 0);
    }

    rect(i*Stripe_Width+Stripe_Offset, 0, Stripe_Width, 600);
  }  


  Stripe_Offset+=2;
  if (Stripe_Offset > Stripe_Width) {
    Stripe_Offset = 0;
    ColorCode++;
  }
}



void stripes2_setup() {
  colorMode(RGB);
}

int i_stripe;

void stripes2_draw() {

  noStroke();
  background(0, 20);
  fill(255, 255);

  //for (int i = 0; i < 125; i = i+1) {
  rect (i_stripe * width/125, 0, width/125, 600);
  //}
  i_stripe++;
  if (i_stripe > 125 ) {
    i_stripe = 0;
  }
}  

Scene stripes = new Scene("stripes", "Stripes") {
  void setup() {stripes_setup();}
  void draw() {stripes_draw();}
};

//
//  Delauney 
//


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


//
// IY Bubbles
// 


void Bubbles_setup() {

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, -450);
  //snowflake = loadImage ("snowflake_small.png");

  //buildRemover();
}

void Bubbles_draw() {
  colorMode(RGB, 255);
  background(0);

  if ((frameCount % fader2) == 1) {
    FCircle b = new FCircle(random(1+fader1, 40+fader1));



    b.setVelocity(random(-fader3), random(-fader3, fader3));
    b.setPosition(normX*width, 800);

    b.setDamping(0.6);
    b.setFriction(0.6);
    b.setRestitution(1);


    b.setStroke(0);

    b.setStrokeWeight(0);
    b.setFill(255, random(255), random(255));
    world.add(b);
  }


  ArrayList BodyList = world.getBodies();
  // FCircle present;
  for (int i=0; i< BodyList.size (); i++) {
    if (BodyList.get(i) instanceof FCircle) {
      if (((FBody)(BodyList.get(i))).getY()<=-50)
        world.remove(       (FBody)BodyList.get(i)      );
    }

    if (((FBody)(BodyList.get(i))).getX()<=0) {
      ((FBody)(BodyList.get(i))).setPosition(0, ((FBody)(BodyList.get(i))).getY());
      ((FBody)(BodyList.get(i))).setVelocity(0, ((FBody)(BodyList.get(i))).getVelocityY()             );
    }


    if (((FBody)(BodyList.get(i))).getX()>=2400) {
      ((FBody)(BodyList.get(i))).setPosition(2048, ((FBody)(BodyList.get(i))).getY());
      ((FBody)(BodyList.get(i))).setVelocity(0, ((FBody)(BodyList.get(i))).getVelocityY()             );
    }
  }


  //remover.setSensor(1);
  world.step();
  world.draw();
  //println(world.getBodies());
}



   void newLines_setup(){
     
     
     
     
  }
  
  
   void newLines_draw(){

    background(0);
    pushMatrix();
    
    rotate(PI/4);
    translate((-frameCount*(fader3/25.5))%fader1+600,-2000);
    for (int i = 0; i <= 1500/fader1;  i++){
      fill(fader4,fader5,fader6);
      rect(fader1 * i, 0, fader1/2, 2800);
      fill(0,0,0);
      rect(fader1 * i + fader1/2, 0, fader1/2, 2800);
    }
    popMatrix(); 


  pushMatrix();    
    
    
    translate(normX*width, -normY*height);
    rotate(-PI/4);

    pushMatrix();
    translate((-frameCount*(fader3/25.5))%fader1-1000,-2300);

    for (int i = 0; i <= 2000/fader1;  i++){
      fill(fader4,fader5,fader6);
      rect(fader1 * i, 0, fader1/2, 3000);
      fill(0,0,0);
      rect(fader1 * i + fader1/2, 0, fader1/2, 3000);
    }
    popMatrix();
    popMatrix(); 
    
    
    
 
     
  }



  int nbr_circles = fader2*2;
  float deviation = (fader3/25.5)/8.0;
  
  float phi = (fader4/25)*(sqrt(5)+1)/2 - 1;            // golden ratio
  float golden_angle = phi * TWO_PI;        // golden angle
  
  void spiral_setup()
  {
    smooth();
    colorMode(HSB, 1);
  }
  
  void spiral_draw()
  {
    background(0,0,0);
  
    fill(0);
    noStroke();
    
    nbr_circles = fader2*2;
    
    float lg_rad = fader5/255.0*width;
    float lg_area = sq(lg_rad) * PI;
    
    float mean_area = lg_area / nbr_circles;
    
    float min_area = mean_area * (1-deviation);
    float max_area = mean_area * (1+deviation);
    
    float cum_area = 0.5;
    
    float fudge = fader6/128.0;
    
    float sx = normX*width;
    float sy = normY*height;
  
    float hue_incr = frameCount * .0002 + .1;
    float angle_offset = frameCount * (fader1/100000.0);
    
    for (int i = 1; i <= nbr_circles; ++i) {
  
      float angle = i*golden_angle + angle_offset;
    
      float ratio = i / (float) nbr_circles;
      float sm_area = min_area + ratio * (max_area - min_area);
  
  
      float sm_dia = 2 * sqrt( sm_area / PI );
      float adj_sm_dia = sm_dia * fudge;
    
      cum_area += sm_area;
    
      float spiral_rad = sqrt( cum_area / PI );
    
      float x = sx + cos(angle) * spiral_rad;
      float y = sy + sin(angle) * spiral_rad;
  
      float hue = hue_incr*i;
      hue -= Math.floor(hue);
      fill(hue, .8, 1);
      
      ellipse(x, y, adj_sm_dia, adj_sm_dia);
    }
    //println(fader1 + " " + fader2 + " " + fader3 + " " + fader4 + " " + fader5 + " " + fader6);
  }


class Cube {

  // Properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;

  // Constructor
  Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ){
    this.w = w;
    this.h = h;
    this.d = d;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
  }

  // Main cube drawing method, which looks 
  // more confusing than it really is. It's 
  // just a bunch of rectangles drawn for 
  // each cube face
  void drawCube(){
    beginShape(QUADS);
    // Front face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Back face
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ);

    // Left face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Right face
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Top face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 

    // Bottom face
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 

    endShape(); 

    // Add some rotation to each box for pizazz.
    rotateY(radians(1));
    rotateX(radians(1));
    rotateZ(radians(1));
  }
}

// Used for oveall rotation
float ang;

// Cube count-lower/raise to test performance
int limit = 900;

// Array for all cubes2
Cube[] cubes2 = new Cube[limit];



void junk_setup() {
  background(0); 
  noStroke();

  // Instantiate cubes, passing in random vals for size and postion
  for (int i = 0; i< cubes2.length; i++){
    cubes2[i] = new Cube(int(random(-10, 10)), int(random(-10, 10)), 
    int(random(-10, 10)), int(random(-140, 140)), int(random(-140, 140)), 
    int(random(-340, 140)));
  }
}

void junk_draw(){
   background(0); 
  fill(200);

  // Set up some different colored lights
  pointLight(51, 102, 255, 65, 60, 100); 
  pointLight(200, 40, 60, -65, -60, -350);

  // Raise overall light in scene 
  ambientLight(fader4, fader5, fader6); 

  // Center geometry in display windwow.
  // you can change 3rd argument ('0')
  // to move block group closer(+)/further(-)
  translate(width/2, height/2, -200 + fader3 * 3);

  // Rotate around y and x axes
  rotateY(radians(ang));
  rotateX(radians(ang));

  // Draw cubes
  for (int i = 0; i < cubes2.length; i++){
    cubes2[i].drawCube();
  }
  
  // Used in rotate function calls above
  fader2 = 5;
  ang = ang + fader2/200.0;
}



void donuts_setup(){
  colorMode(RGB);
  }
  
void donuts_draw(){
    background(0);
    noStroke();
    //translate(-frameCount%fader1-1000,-2300);
    for (int j = 0; j <= height/fader1;  j= j +2){
    for (int i = 0; i <= width/fader1;  i++){
      fill(fader4,fader5,fader6);
      ellipseMode(CENTER);
      ellipse(fader1*2 * i,  j * fader1 + fader1/2, sin(frameCount/1000.0*fader2)*fader3, sin(frameCount/1000.0*fader2)*fader3);
      ellipse((fader1*2 * i)+fader1, j * fader1 + fader1/2, cos(frameCount/1000.0*fader2)*fader3, cos(frameCount/1000.0*fader2)*fader3);
      fill(0,0,0);
//
      fill(fader4,fader5,fader6);
      ellipseMode(CENTER);
      ellipse(fader1*2 * i,  (j +1 ) *fader1 + fader1/2, cos(frameCount/1000.0*fader2)*fader3, cos(frameCount/1000.0*fader2)*fader3);
      ellipse((fader1*2 * i)+ fader1, (j +1 ) *fader1 + fader1/2, sin(frameCount/1000.0*fader2)*fader3, sin(frameCount/1000.0*fader2)*fader3);
      fill(0,0,0);
    
  }
    }

  }


void donuts2_setup(){
  }
  
void donuts2_draw(){
    background(0);
    //fader1 = 100;
    noStroke();
    //translate(-frameCount%fader1-1000,-2300);
    for (int j = 0; j <= height/fader1;  j= j +2){
    for (int i = 0; i <= width/fader1;  i++){
      fill(fader4,fader5,fader6);
      ellipseMode(CENTER);
      ellipse(fader1*2 * i,  j * fader1 + fader1/2, sin(frameCount/1000.0*fader2)*fader3, sin(frameCount/1000.0*fader2)*fader3);
      ellipse((fader1*2 * i)+fader1, j * fader1 + fader1/2, cos(frameCount/1000.0*fader2)*fader3, cos(frameCount/1000.0*fader2)*fader3);
      fill(0,0,0);
      ellipse(fader1*2 * i,  j * fader1 + fader1/2, sin(frameCount/1000.0*fader2)*fader3/2, sin(frameCount/1000.0*fader2)*fader3/2);
      ellipse((fader1*2 * i)+fader1, j * fader1 + fader1/2, cos(frameCount/1000.0*fader2)*fader3/2, cos(frameCount/1000.0*fader2)*fader3/2);
      fill(0,0,0);
//
      fill(fader4,fader5,fader6);
      ellipseMode(CENTER);
      ellipse(fader1*2 * i,  (j +1 ) *fader1 + fader1/2, cos(frameCount/1000.0*fader2)*fader3, cos(frameCount/1000.0*fader2)*fader3);
      ellipse((fader1*2 * i)+ fader1, (j +1 ) *fader1 + fader1/2, sin(frameCount/1000.0*fader2)*fader3, sin(frameCount/1000.0*fader2)*fader3);
      fill(0,0,0);

      ellipse(fader1*2 * i,  (j +1 ) *fader1 + fader1/2, cos(frameCount/1000.0*fader2)*fader3/2, cos(frameCount/1000.0*fader2)*fader3/2);
      ellipse((fader1*2 * i)+ fader1, (j +1 ) *fader1 + fader1/2, sin(frameCount/1000.0*fader2)*fader3/2, sin(frameCount/1000.0*fader2)*fader3/2);
      fill(0,0,0);
    
  }
    }

  }




Scene bubbles = new Scene("bubbles", "Bubbles") {
  void setup() {
    Bubbles_setup();
  }
  void draw() {
    Bubbles_draw();
  }
};




Scene newLines = new Scene("newLines", "New Lines: diag lines") {
  void setup() {
    newLines_setup();
  }
  void draw() {
    newLines_draw();
  }
};

Scene donuts = new Scene("donuts", "Pulsing Circles") {
  void setup() {
    donuts_setup();
  }
  void draw() {
    donuts_draw();
  }
};



Scene spiral = new Scene("spiral", "Spiral of circles") {
  void setup() {
    spiral_setup();
  }
  void draw() {
    spiral_draw();
  }
};


Scene junk = new Scene("junk", "Space Junk") {
  void setup() {
    junk_setup();
  }
  void draw() {
    junk_draw();
  }
};

Scene donuts2 = new Scene("donuts2", "Pulsing Donuts") {
  void setup() {
    donuts2_setup();
  }
  void draw() {
    donuts2_draw();
  }
};