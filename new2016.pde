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