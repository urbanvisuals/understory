// Lines 
// need to loop this so it's not as repetative

Lines rs1, rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10, rs11, rs12;

int numVLines = 0;

//ArrayList<VerticleLines> vlines = new ArrayList<VerticleLines>();

void gridAnimate_setup(){
  //colorMode(RGB, 255);
  
  numVLines = width / 60;
  
  println(numVLines);
  
  //rect(30, 20, 55, 55);
  //noFill();
  rs1 = new Lines(20, 2.0); 
  rs2 = new Lines(80, 2.0);
  rs3 = new Lines(140, 2.0); 
  rs4 = new Lines(200, 2.0);
  rs5 = new Lines(260, 2.0); 
  rs6 = new Lines(320, 2.0);
  rs7 = new Lines(380, 2.0); 
  rs8 = new Lines(440, 2.0);
  rs9 = new Lines(500, 2.0);
  rs10 = new Lines(560, 2.0);
  rs11 = new Lines(620, 2.0);
  rs12 = new Lines(680, 2.0);
}

void gridAnimate_draw(){
  
  // controlled by the faders
  background(red1, blue1, green1);
  
  color stroke1 = color(255, 255, 255);
  stroke(stroke1);
  strokeWeight(5);
  
  pushMatrix();
  
  line(60, 0, 1, 60, 600, 1);
  for(int i = 0; i <= numVLines; i++){
    println(numVLines);
    println(i);
    line(i * 60, 0, 1, i * 60, 600, 1);
  }
  popMatrix();
  
  
  //int zs = (int)map(fader1, 0, 255, 30, 100);
  // removed the zscale fro each update function
  rs1.update(1, red2, blue2, green2); 
  rs2.update(2, red2, blue2, green2);
  rs3.update(3, red2, blue2, green2); 
  rs4.update(4, red2, blue2, green2); 
  rs5.update(5, red2, blue2, green2); 
  rs6.update(6, red2, blue2, green2);
  rs7.update(7, red2, blue2, green2);
  rs8.update(8, red2, blue2, green2);
  rs9.update(9, red2, blue2, green2);
  rs10.update(10, red2, blue2, green2);
  rs11.update(10, red2, blue2, green2);
  rs12.update(12, red2, blue2, green2);
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
  void update(int i, int r, int g, int b) {
    pushMatrix();
    // Change to fader#
    sw = 5;
    
    // todo can be rgb color 
    // color strokeColor = color(r, g, b);
    color strokeColor = color(255, 255, 255);
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

Scene gridAnimate = new Scene("gridAnimate", "Grid Animate") {
  void setup() { gridAnimate_setup(); }
  void draw() { gridAnimate_draw(); }
};