
void pacingBalls_setup(){
  noStroke();
  fill(255, 204, 255); 
}

void pacingBalls_draw(){

}

Scene pacingBalls = new Scene("pacingBalls", "Pacing Balls") {
  void setup() { pacingBalls_setup(); }
  void draw() { pacingBalls_draw(); }
};


//
//  WAVY CIRCLES
//



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


//
// Rotating Squares
// 
 
float a;                 // Angle of rotation
float offsetSquares = PI/24.0;  // Angle offset between boxes
int num = 12;            // Number of boxes
float b = 0.0;
float s = 0.0;


void rotatingSquares_setup(){
  
  println("width", width);
  smooth();

}

void rotatingSquares_draw(){
  lights();
  
  pushMatrix();
  
  b = b + 0.01;
  s = cos(b)*3;
  colorMode(RGB);
  background(red1, green1, blue1);
  translate(width/2, height/2); 
  //scale(s);
  scale(map(fader1, 0, 255, 0, 3));
  
  for(int i = 0; i < num; i++) {
    //float gray = map(i, 0, num-1, 0, 255);
    
    //float r = map(red2, 0, num-1, 0, 255);
    //float g = map(green2, 0, num-1, 0, 255);
    //float b = map(blue2, 0, num-1, 0, 255);
    
    float r = red2;
    float g = green2;
    float b = blue2;
    
    pushMatrix();
    fill(r, g, b);
    rotateY(a + offsetSquares*i);
    rotateX(a/2 + offsetSquares*i);
    box(200);
    popMatrix();
  }
  
  a += map(fader2, 0, 255, 0.0, 0.1);
  
  popMatrix();

}



Scene rotatingSquares = new Scene("rotatingSquares", "Rotating Squares") {
  void setup() {
    rotatingSquares_setup();
  }
  void draw() {
    rotatingSquares_draw();
  }
};


//
// Animation alternating dots and spin
// Wayhome 2016
//


int ellipseSize = 40;
boolean pauseDots = false;
int dotSpeed = 2;

int animationX = 0;
int animationY = 0;

float rotateDeg = 0.0;
float rotateDegBy = 0.1;

long interval = 1000;
long previousMillis = 0;
long currentMillis = 0;

float halfWidth = width / 2;
float halfHeight = height / 2;

void rotatingDots_setup(){
  noStroke();
  fill(255, 204, 255); 
}

void rotatingDots_draw(){
  background(fader4, fader5, fader6);
  
  currentMillis = millis();
  
  if(currentMillis - previousMillis >= interval) {
      pauseDots = false;
  }
  
  // Incase the screen gets resized recalculate the halfscreen values
  halfWidth = width / 2;
  halfHeight = height / 2;
  
  pushMatrix();
  translate(width, height);
  rotate(rotateDeg*TWO_PI/360);
  translate(-width, -height);
  
  
  // Yellow Circles
  pushMatrix();
  float x = 0.0;
  float y = 0.0;
  noStroke();
  fill(red1, green1, blue1);
  
  for (y = -halfHeight; y < height * 5; y += ellipseSize * 2){
    for (x = -halfWidth; x < width * 3; x += ellipseSize * 2){
      ellipse(x + animationX, y + animationY, ellipseSize, ellipseSize);
    }
  }
 
  if(pauseDots == false){
    if(animationX > 0 && animationY == ellipseSize * 2){
      animationX -= dotSpeed;
    } else if(animationX == 0 && animationY > 0) {
      animationY -= dotSpeed;
    } else {
      
      if(animationX < ellipseSize * 2 ){
        animationX += dotSpeed;
      } else {
        if(animationX == ellipseSize * 2 && animationY < ellipseSize * 2){
          animationY += dotSpeed;
        }
      }
    }
  }

  // Debugging circle positions
  //println("X ----- " +  animationX);
  //println("Y ----- " +  animationY);
  //println("S ----- " + ellipseSize * 2);
  //println("============================");
  
  if(pauseDots == false){
    if(animationX == 0 && animationY == 0){
      pauseDots = true;
      previousMillis = currentMillis;
    }
    
    if(animationX == 0 && animationY == ellipseSize * 2){
      pauseDots = true;
      previousMillis = currentMillis;
    }
    
    if(animationX == ellipseSize * 2 && animationY == 0){
      pauseDots = true;
      previousMillis = currentMillis;
    }
    
    if(animationX == ellipseSize * 2 && animationY == ellipseSize * 2){
      pauseDots = true;
      previousMillis = currentMillis;
    }
  }
  popMatrix();
  
  // Purple Circles
  pushMatrix();
  x = 0;
  y = 0;
  noStroke();
  fill(red2, green2, blue2);
  
  for (y = -halfHeight; y < height * 5; y += ellipseSize * 2){
    for (x = -halfWidth; x < width * 3; x += ellipseSize * 2){
      ellipse(x, y, ellipseSize, ellipseSize);
    }
  }
  popMatrix();
  popMatrix();

  rotateDeg += rotateDegBy;
}

Scene rotatingDots = new Scene("rotatingDots", "Rotating Dots") {
  void setup() { rotatingDots_setup(); }
  void draw() { rotatingDots_draw(); }
};

//
//  Particle Attracts
//


import punktiert.math.Vec;
import punktiert.physics.*;


// world object
VPhysics physics;

// number of particles in the scene
int amount = 100;

void particleAttracts_setup(){
  colorMode(RGB, 255, 255, 255);
  background(0, 0, 0);
  size(2400, 600);
  fill(255,255,255);
  noStroke();
  
  physics = new VPhysics();
  physics.setfriction(.2f);

  for (int i = 0; i < amount; i++) {
    // val for arbitrary radius
    float rad = random(20, 60);
    // vector for position
    Vec pos = new Vec(random(rad, width - rad), random(rad, height - rad));
    // create particle (Vec pos, mass, radius)
    VParticle particle = new VParticle(pos, 2, rad);
    // add Collision Behavior
    particle.addBehavior(new BCollision());
    // add Local Attractor on each Particle (radius, strength)
    particle.addBehavior(new BAttractionLocal(rad*5, 1));
    // add particle to world
    physics.addParticle(particle);
  }
}

void particleAttracts_draw(){
  //background(255);
  colorMode(RGB, 255, 255, 255);
  background(red1, green1, blue1);
  fill(red2, green2, blue2);

  physics.update();

  for (VParticle p : physics.particles) {
    ellipse(p.x, p.y, p.getRadius() * 2, p.getRadius() * 2);
  }
}

Scene particleAttracts = new Scene("particleAttracts", "Particle Attracts") {
  void setup() { particleAttracts_setup(); }
  void draw() { particleAttracts_draw(); }
};

//
// Clocks
//

// P_2_1_1_04.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * shapes in a grid, that are always facing the mouse
 *    
 * MOUSE
 * position x/y        : position to face
 * 
 * KEYS
 * 1-7                 : choose shapes
 * arrow up/down       : scale of shapes
 * arrow left/right    : additional rotation of shapes
 * c                   : toggle. color mode
 * d                   : toggle. size depending on distance
 * g                   : toggle. grid resolution
 * s                   : save png
 * p                   : save pdf
 */

//import processing.pdf.*;
//import java.util.Calendar;

//boolean savePDF = false;

PShape currentShape;

int w = 2400;
int h = 600;
int t = 0;

//int tileCount = 10;
int tileCountX = w / 60;
int tileCountY = h / 60;

float tileWidth, tileHeight;
float shapeSize = 50;
float newShapeSize = shapeSize;
float shapeAngle = 0;
float maxDist;

color shapeColor = color(0, 130, 164);
int fillMode = 0;
int sizeMode = 0;

int[] ranX = { 10, 200, 2, 20 };
int[] ranY = { 20, 200, 12, 20, 2 };

void clocks_setup(){
 
  smooth();

  //tileWidth = width/float(tileCount);
  //tileHeight = height/float(tileCount);
  tileWidth = width/float(tileCountX);
  tileHeight = height/float(tileCountY);
  maxDist = sqrt(sq(width)+sq(height));

  currentShape = loadShape("module_1.svg");
  
  println("maxDist: ", maxDist);
  
  println("-- currentShape", currentShape);
}

void clocks_draw(){
  background(red1, green1, blue1);
  
  smooth();

  for (int gridY=0; gridY<tileCountY; gridY++) {
    for (int gridX=0; gridX<tileCountX; gridX++) {

      float posX = tileWidth*gridX + tileWidth/2;
      float posY = tileHeight*gridY + tileWidth/2;

      // calculate angle between mouse position and actual position of the shape
      //float angle = atan2(mouseY-posY, mouseX-posX) + radians(shapeAngle);
      //float angle = atan2(y(t)-posY, x(t)-posX) + radians(shapeAngle);
      
      float mapX = map(normX, 0, 1, 0, width);
      float mapy = map(normY, 0, 1, height, 0);
      
      float angle = atan2(mapy-posY, mapX-posX) + radians(shapeAngle);
      //float angle = atan2(y(t)-posY, x(t)-posX);
      //float angle = atan2(sin(t), sin(t));

      pushMatrix();
      translate(posX, posY);
      rotate (angle);
      shapeMode (CENTER);

      noStroke();
      currentShape.disableStyle();
      scale(map(fader1, 0, 255, 0, 2), map(fader2, 0, 255, 0, 2));
      color(red2, green2, blue2);
      fill(red2, green2, blue2);
      shape(currentShape, 0,0, newShapeSize,newShapeSize);
      popMatrix();
    }
  }
  
  t++;
}

// Get random values for x and y calculations
void randomizePositions() {
  
  for (int i = 0; i < ranX.length; i++){
    ranX[i] = ceil(random(20));
  }
  
  for (int j = 0; j < ranY.length; j++){
    ranY[j] = ceil(random(20));
  }

}

float x(int t){
  // return width / 2 + ((sin(t / 10) * 100 + sin(t / 5) * 20));
  // return width / 2 + ((sin(t / 10) * 200 + sin(t) * 2));
  
  //return int( w / 2 + ((sin(t / ranX[0]) * 200 + sin(t) * ranX[2]  + sin(t / ranX[3]))) );
  return w / 2 + ((sin(t / ranX[0]) * 200 + sin(t) * ranX[2]  + sin(t / ranX[3])));
}

float y(int t){
  // return height / 2 + (cos(-t / 10) * 100 + sin(t/5) * 20);
  // return width / 2 + (cos(t / 10) * 100);
  // return width / 2 + (cos(t / 20) * 200 + cos(t / 12) * 20);
  
  //return int( h / 2 + (cos(t / ranY[0]) * 200 + cos(t / ranY[2]) * ranY[3] + cos(t / ranY[4])) );
  return h / 2 + (cos(t / ranY[0]) * 200 + cos(t / ranY[2]) * ranY[3] + cos(t / ranY[4]));
}


Scene clocks = new Scene("clocks", "s: Clock animations") {
  void setup() {
    clocks_setup();
  }
  void draw() {
    clocks_draw();
  }
};


//
//  Alternating Sine
//

 
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

//
//  Expanding Squares
//


float speed = 2.5;  // set to fader
float size = 0;   
float gap = 100;    // set to fader

void expandingSquares_setup(){
  noStroke();
  fill(red1, green1, blue1); 
}

void expandingSquares_draw(){
  speed = map(fader1, 0, 255, 0, 10);  // set to fader
  gap = map(fader2, 0, 255, 3, 500);    // set to fader
  pushMatrix();
  int numRects = 2400/int(gap);
  
  //fill(255, 204, 255); 
  fill(red1, green1, blue1);
  
  //background(0);
  rectMode(CENTER);
  translate(width/2, height/2);   //translate to x and y input
  rotate(PI/3);     //set to fader or set to rotate automatically
  for (int i = numRects; i > -2 ; i--) {
    if (i%2==0)fill(red1,green1,blue1);  //set to RGB faders
    else fill(red2,green2,blue2);    // set to RGB faders
    rotate(PI*i/.04);
    println(i);
    if (i*gap+size > 0){
      rect(0, 0, i*gap+size, i*gap+size);
    }
  }
  size = size + speed;
  if (size > gap*2)size=0;
  popMatrix();
  rectMode(CORNER);
}

Scene expandingSquares = new Scene("expandingSquares", "Expanding Squares") {
  void setup() { expandingSquares_setup(); }
  void draw() { expandingSquares_draw(); }
};

// Zigzag 
// need to loop this so it's not as repetative
//


ZigZag z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12;

void zigzagv2_setup(){
  noFill();
  z1 = new ZigZag(20, 2.0); 
  z2 = new ZigZag(80, 2.0);
  z3 = new ZigZag(140, 2.0); 
  z4 = new ZigZag(200, 2.0);
  z5 = new ZigZag(260, 2.0); 
  z6 = new ZigZag(320, 2.0);
  z7 = new ZigZag(380, 2.0); 
  z8 = new ZigZag(440, 2.0);
  z9 = new ZigZag(500, 2.0);
  z10 = new ZigZag(560, 2.0);
  z11 = new ZigZag(620, 2.0);
  z12 = new ZigZag(680, 2.0);
}

void zigzagv2_draw(){
  // controlled by the faders
  background(red1, blue1, green1);
  int zs = (int)map(fader1, 0, 255, 30, 100);
  println(zs);
  z1.update(1, red2, blue2, green2, zs); 
  z2.update(2, red2, blue2, green2 , zs);
  z3.update(3, red2, blue2, green2, zs); 
  z4.update(4, red2, blue2, green2 , zs); 
  z5.update(5, red2, blue2, green2, zs); 
  z6.update(6, red2, blue2, green2, zs);
  z7.update(7, red2, blue2, green2, zs);
  z8.update(8, red2, blue2, green2, zs);
  z9.update(9, red2, blue2, green2, zs);
  z10.update(10, red2, blue2, green2, zs);
  z11.update(10, red2, blue2, green2, zs);
  z12.update(12, red2, blue2, green2, zs);
}

class ZigZag { 
  float ypos, speed, zigYPos;
  boolean zigDirection = true;
  int startX = 0;
  int zigSize = 40;
  
  color stroke = color(132, 20, 247);
  color strokeDark = color(132, 220, 247);
  int strokeWeight = zigSize / 2;
  
  ZigZag (float y, float s) {  
    ypos = y; 
    speed = s; 
    stroke(stroke);
    strokeWeight(strokeWeight);
  }
  
  void update(int i, int r, int g, int b, int zigSizeUpdate) {
    
    // for trying to spread out the vertical space
    // need to look into further
    //zigSize = zigSizeUpdate;
    
    strokeWeight = zigSizeUpdate / 2;
    strokeWeight(strokeWeight);
    
    // for trying to spread out the vertical space
    // need to look into further
    //ypos = (zigSize + zigSize / 2) * i  + zigSize / 2;
    
    color strokeColor = color(r, g, b);
    stroke(strokeColor);
    
    startX = 0;
    zigDirection = true;
    ypos -= speed;
    zigYPos = ypos;
    
    if (ypos < -zigSize * 2) { 
      ypos = height + zigSize; 
    } 
    
    strokeJoin(MITER);
    beginShape();
    noFill();
    while (startX <= width){
      vertex(startX, zigYPos);
      
      startX += zigSize;
      if (zigDirection == true){
        zigYPos += zigSize;
      } else {
        zigYPos -= zigSize;
      }
      
      zigDirection =! zigDirection;
    }
    
    endShape();
  } 
} 

Scene zigzagv2 = new Scene("zigzagv2", "Zig Zag v2") {
  void setup() { zigzagv2_setup(); }
  void draw() { zigzagv2_draw(); }
};