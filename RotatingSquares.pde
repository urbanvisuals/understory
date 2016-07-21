// Rotating Squares
 
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