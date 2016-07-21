float angle = 0.0;
float offset = 300;
float scalar = offset / 1.5;
float circleSize = map(fader1, 0.0, 255.0, 100.0, 500.0);
float wavespeed = map(fader2, 0.0, 255.0, 0.0, 0.8);
float angleOffset = 0.0;
int numCircles;

void wavvyCircles_setup(){
  noStroke();
  fill(red2, green2, blue2);
  numCircles = (int)(width / circleSize) + 2;
}

void wavvyCircles_draw(){
  circleSize = map(fader1, 0.0, 255.0, 100.0, 500.0);
  wavespeed = map(fader2, 0.0, 255.0, 0.0, 0.8);
  pushMatrix();
  background(red1, green1, blue1);
  translate(-circleSize, 0);
  fill(red2, green2, blue2);
  for (int i = 1; i < numCircles; i++){
    float y1 = offset + sin(angle + angleOffset) * scalar;
    ellipse(circleSize * i, y1, circleSize, circleSize);
    angleOffset += 0.4;
  }
  angleOffset = 0.0;
  angle += wavespeed;
  popMatrix();

}

Scene wavvyCircles = new Scene("wavvyCircles", "Wavvy Circles") {
  void setup() { wavvyCircles_setup(); }
  void draw() { wavvyCircles_draw(); }
};