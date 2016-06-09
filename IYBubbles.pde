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


