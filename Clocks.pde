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

//PShape currentShape;

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
  
  println("width", width);
  //size(600, 600);
  //background(255);
  //background(255,255,255);
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
  background(255);
  //background(0, 0, 0);
  //background(255,255,255);
  smooth();

  println(tileCountX);
  println(tileCountY);

  for (int gridY=0; gridY<tileCountY; gridY++) {
    for (int gridX=0; gridX<tileCountX; gridX++) {

      float posX = tileWidth*gridX + tileWidth/2;
      float posY = tileHeight*gridY + tileWidth/2;

      // calculate angle between mouse position and actual position of the shape
      //float angle = atan2(mouseY-posY, mouseX-posX) + radians(shapeAngle);
      
      //float angle = atan2(y(t)-posY, x(t)-posX) + radians(shapeAngle);
      
      float angle = atan2(y(t)-posY, x(t)-posX);
      //float angle = atan2(sin(t), sin(t));
      
      // This was breaking some of the logic and making it not display
      //if (sizeMode == 0) newShapeSize = shapeSize;
      //if (sizeMode == 1) newShapeSize = shapeSize*1.5-map(dist(mouseX,mouseY,posX,posY),0,500,5,shapeSize);
      //if (sizeMode == 2) newShapeSize = map(dist(mouseX,mouseY,posX,posY),0,500,5,shapeSize);

      //if (fillMode == 0) currentShape.enableStyle();
      //if (fillMode == 1) {
      //  currentShape.disableStyle();
      //  fill(shapeColor);      
      //}
      //if (fillMode == 2) {
      //  currentShape.disableStyle();
      //  float a = map(dist(mouseX,mouseY,posX,posY), 0,maxDist, 255,0);
      //  fill(shapeColor, a);      
      //}
      //if (fillMode == 3) {
      //  currentShape.disableStyle();
      //  float a = map(dist(mouseX,mouseY,posX,posY), 0,maxDist, 0,255);
      //  fill(shapeColor, a);      
      //}

      pushMatrix();
      translate(posX, posY);
      rotate (angle);
      shapeMode (CENTER);

      noStroke();
      color(0);
      //fill(255);
      shape(currentShape, 0,0, newShapeSize,newShapeSize);
      popMatrix();
    }
  }
  
  if (frameCount % 500 == 0){
    randomizePositions();
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