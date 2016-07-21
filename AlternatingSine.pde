 
int xspacing = 20;   // How far apart should each horizontal location be spaced
int widthScene;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 25.0;  // Height of wave
float period = 1000.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvaluesA;  // Using an array to store height values for the wave
float[] yvaluesB;  // Using an array to store height values for the wave

//int strokeWeight = 50;
int strokeWeight = 60;
int horizontalWaveNumber = 4;

int alphaValue = 150;
int pos;



void alternatingSine_setup(){
  frameRate(30);
  //size(1000, 600);
  //blendMode(BLEND);
  //colorMode(RGB, 255);
  
  // This makes it end just before the right side of the screen
  //widthScene = width+16;
  widthScene = width + xspacing * 4;
  dx = (TWO_PI / period) * xspacing;
  yvaluesA = new float[widthScene/xspacing];
  yvaluesB = new float[widthScene/xspacing];
}

void alternatingSine_draw(){
  background(0, 0, 0);
  pos = height / (horizontalWaveNumber + 1);
  println("pos: " + pos);
  
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  //theta += 0.2;
  theta += map(fader1, 0.0, 255.0, 0.0, 1.0);

  // For every x value, calculate a y value with sine function
  float xA = theta;
  for (int i = 0; i < yvaluesA.length; i++) {
    yvaluesA[i] = sin(xA)*amplitude;
    xA += dx;
  }
  
  float xB = theta;
  for (int i = 0; i < yvaluesB.length; i++) {
    yvaluesB[i] = sin(-xB)*amplitude;
    xB += dx;
  }
}

void renderWave() {
  
  alphaValue = fader2;
  
  // A simple way to draw the wave with an ellipse at each location
  noFill();
  pushMatrix();
  
  strokeWeight(strokeWeight);
  //translate(-30, -1 * ((height / 2) - pos) );
  translate(-30, -height);
  
  pushMatrix();
  noFill();
  for (int l = 0; l <= (horizontalWaveNumber + 2); l++){
    println("l: " + l);
    //pushMatrix();
    //translate(0, translateY);
    println(pos);
    
    //translate(0, 150);
    translate(0, pos);
    
    //stroke(223, 0, 71, alphaValue);
    stroke(red1, green1, blue1, alphaValue);
    beginShape();
    for (int x = 0; x < yvaluesA.length; x++) {
      curveVertex(x * xspacing, height/2+yvaluesA[x]);
    }
    endShape();
    
    stroke(red2, green2, blue2, alphaValue);
    beginShape();
    for (int x = 0; x < yvaluesB.length; x++) {
      curveVertex(x * xspacing, height/2+yvaluesB[x]);
    }
    endShape();
  }
  popMatrix();
  
  popMatrix();
}

Scene alternatingSine = new Scene("alternatingSine", "Alternating Sine Waves") {
  void setup() { alternatingSine_setup(); }
  void draw() { alternatingSine_draw(); }
};