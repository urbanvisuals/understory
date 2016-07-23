// Lines 
// need to loop this so it's not as repetative

Lines rs1, rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10, rs11, rs12;

int numVLines = 0;
float hSpeed = 2.0;
float hPos = 0.0;


//ArrayList<HLines> hlines;
//hlines = new ArrayList<HLines>();

ArrayList<HLines> hlines = new ArrayList<HLines>();

float spd = 0;

void gridAnimate_setup(){
  //colorMode(RGB, 255);
  
  numVLines = width / 60;
  
  println(numVLines);
  
  spd = map(fader1, 0, 255, 0, 5);
  
  for(int i = 0; i <= numVLines; i++){
    int xPos = i * 60;
    hlines.add(new HLines(xPos, spd));
  }
  
  //rect(30, 20, 55, 55);
  //noFill();
  rs1 = new Lines(20, spd); 
  rs2 = new Lines(80, spd);
  rs3 = new Lines(140, spd); 
  rs4 = new Lines(200, spd);
  rs5 = new Lines(260, spd); 
  rs6 = new Lines(320, spd);
  rs7 = new Lines(380, spd); 
  rs8 = new Lines(440, spd);
  rs9 = new Lines(500, spd);
  rs10 = new Lines(560, spd);
  rs11 = new Lines(620, spd);
  rs12 = new Lines(680, spd);
}

void gridAnimate_draw(){
  
  spd = map(fader1, 0, 255, 0, 5);
  
  // controlled by the faders
  background(red1, green1, blue1);
  
  color stroke1 = color(255, 255, 255);
  stroke(stroke1);
  float f4 = map(fader4, 0, 255, 1, 20);
  strokeWeight(f4);

  //int zs = (int)map(fader1, 0, 255, 30, 100);
  // removed the zscale fro each update function
  rs1.update(1, red2, green2, blue2, spd, f4); 
  rs2.update(2, red2, green2, blue2, spd, f4);
  rs3.update(3, red2, green2, blue2, spd, f4); 
  rs4.update(4, red2, green2, blue2, spd, f4); 
  rs5.update(5, red2, green2, blue2, spd, f4); 
  rs6.update(6, red2, green2, blue2, spd, f4);
  rs7.update(7, red2, green2, blue2, spd, f4);
  rs8.update(8, red2, green2, blue2, spd, f4);
  rs9.update(9, red2, green2, blue2, spd, f4);
  rs10.update(10, red2, green2, blue2, spd, f4);
  rs11.update(10, red2, green2, blue2, spd, f4);
  rs12.update(12, red2, green2, blue2, spd, f4);
  
  for (int i = hlines.size()-1; i >= 0; i--) { 
    HLines horizontalLine = hlines.get(i);
    horizontalLine.update(i, red2, green2, blue2, f4);
  } 
}

class Lines { 
  float ypos, speed, zigYPos;
  boolean zigDirection = true;
  int startX = 0;
  int zigSize = 40;
  
  color stroke = color(132, 20, 247);
  float sw = 0;
  
  Lines (float y, float s) {  
    ypos = y; 
    speed = s; 
    stroke(stroke);
    sw = 0;
    strokeWeight(sw);
  }
  
  //void update(int i, int r, int g, int b, int zigSizeUpdate) {
  void update(int i, int r, int g, int b, float spd, float f4) {
    pushMatrix();
    // Change to fader#
    sw = f4;
    
    speed = spd;
    
    // todo can be rgb color 
     color strokeColor = color(r, g, b);
    //color strokeColor = color(255, 255, 255);
    stroke(strokeColor);
    strokeWeight(sw);
    
    startX = 0;
    zigDirection = true;
    ypos -= speed;
    zigYPos = ypos;
    
    if (ypos < -zigSize * 2) { 
      ypos = height + zigSize; 
    } 
    
    line(startX, zigYPos, 1, width, zigYPos, 1);
    popMatrix();
  } 
}


class HLines { 
  float xpos, speed, zigXPos;
  boolean zigDirection = true;
  int startX = 0;
  int zigSize = 40;
  
  color stroke = color(132, 20, 247);
  float sw = 0;
  
  HLines (float x, float s) {  
    xpos = x; 
    speed = s; 
    stroke(stroke);
    sw = 0;
    strokeWeight(sw);
  }
  
  //void update(int i, int r, int g, int b, int zigSizeUpdate) {
  void update(int i, int r, int g, int b, float f4) {
    pushMatrix();
    // Change to fader#
    sw = f4;
    
    // todo can be rgb color 
     color strokeColor = color(r, g, b);
    //color strokeColor = color(255, 255, 255);
    stroke(strokeColor);
    strokeWeight(sw);
    
    startX = 0;
    zigDirection = true;
    xpos += speed;
    zigXPos = xpos;
    
    if (xpos >= width) { 
      xpos = 0; 
    } 
    
    line(zigXPos, 0, 1, zigXPos, height, 1);
    popMatrix();
  } 
} 


Scene gridAnimate = new Scene("gridAnimate", "Grid Animate") {
  void setup() { gridAnimate_setup(); }
  void draw() { gridAnimate_draw(); }
};