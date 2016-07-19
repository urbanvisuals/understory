// Animation alternating dots and spin
// Wayhome 2016

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