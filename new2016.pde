//
// Star rectangles
//

void stars_setup() {
}

void stars_draw() {
  rectMode(CENTER);
  noFill();
  stroke(red1, green1, blue1);

  colorMode(RGB);
  background(red2, green2, blue2);
  pushMatrix();
  translate(normX*2400, -normY*600+600);
  for (int i = 0; i < 2405; i+=fader2) {
    float angle = sin(radians(i/2-frameCount*5))*15;
    if (angle > 1) {
      strokeWeight(angle);
    } else {
      strokeWeight(1);
    }
    rotate(PI/4);
    rotate((frameCount/20)*fader4);
    pushMatrix();
    rect(0, 0, i, i);
    popMatrix();
  }
  popMatrix();
  rectMode(CORNER);
}

Scene starsScene = new Scene("Stars", "Stars") {
  void setup() { 
    stars_setup();
  }
  void draw() { 
    stars_draw();
  }
};

////
//// dotsy
////

float af;
float sf;
float bf = 0.0;
float tf = 0.0;

void dotsy_setup() {
  noStroke();
  ellipseMode(CENTER);
  colorMode(RGB);
}

void dotsy_draw() {

  fader2=200;
  fader1=100;
  fader3=100;
  
 
  
  background(0);

  af = af + fader1/10000.;
  bf = bf + 0.04;
  sf = cos(af)*50;
  tf = cos(bf)*PI;

  strokeWeight(fader4/10);
  stroke(red2,green2,blue2);

  for (int i =0; i < 2400; i = i + fader3) {
    for (int j =0; j < 600; j = j + fader3) {

      //pushMatrix();  
      //rotate((tf));
      //translate(i, j);
      //scale(sf); 
      fill(red1,green1,blue1);
      ellipse(sf + i, j, fader2, fader2); 
      ellipse(-sf + i, j, fader2, fader2); 
      ellipse(i, j -sf, fader2, fader2); 
      ellipse(i, j +sf, fader2, fader2); 

      //popMatrix();
    }
  }
}

Scene dotsy_Scene = new Scene("dotsy", "dotsy") {
  void setup() { 
    dotsy_setup();
  }
  void draw() { 
    dotsy_draw();
  }
};