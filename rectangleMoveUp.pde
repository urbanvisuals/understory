// RecLine 
// need to loop this so it's not as repetative

RecLine r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12;

void rectangleMoveUp_setup(){
  //colorMode(RGB, 255);
  
  rect(30, 20, 55, 55);
  //noFill();
  r1 = new RecLine(20, 2.0); 
  r2 = new RecLine(80, 2.0);
  r3 = new RecLine(140, 2.0); 
  r4 = new RecLine(200, 2.0);
  r5 = new RecLine(260, 2.0); 
  r6 = new RecLine(320, 2.0);
  r7 = new RecLine(380, 2.0); 
  r8 = new RecLine(440, 2.0);
  r9 = new RecLine(500, 2.0);
  r10 = new RecLine(560, 2.0);
  r11 = new RecLine(620, 2.0);
  r12 = new RecLine(680, 2.0);
}

void rectangleMoveUp_draw(){
  // controlled by the faders
  background(red1, blue1, green1);
  //background(255, 0, 0);
  //int zs = (int)map(fader1, 0, 255, 30, 100);
  //println(zs);
  // removed the zscale fro each update function
  r1.update(1, red2, blue2, green2); 
  r2.update(2, red2, blue2, green2);
  r3.update(3, red2, blue2, green2); 
  r4.update(4, red2, blue2, green2); 
  r5.update(5, red2, blue2, green2); 
  r6.update(6, red2, blue2, green2);
  r7.update(7, red2, blue2, green2);
  r8.update(8, red2, blue2, green2);
  r9.update(9, red2, blue2, green2);
  r10.update(10, red2, blue2, green2);
  r11.update(10, red2, blue2, green2);
  r12.update(12, red2, blue2, green2);
}

class RecLine { 
  float ypos, speed, zigYPos;
  boolean zigDirection = true;
  int startX = 0;
  int zigSize = 40;
  
  color stroke = color(132, 20, 247);
  color strokeDark = color(132, 220, 247);
  //int strokeWeight = zigSize / 2;
  float sw = 0;
  
  RecLine (float y, float s) {  
    ypos = y; 
    speed = s; 
    
    // For touchOSC comment this line out
    sw = map(zigYPos, 0, 600, 0, 100);


    // For touch OSC unbcomment these three lines
    // The faders will allow to control the size of the top and bottom sizes
    // of the stroke line
    //float mapStrokeResize1 = map(fader1, 0, 255, 0, 100);
    //float mapStrokeResize2 = map(fader2, 0, 255, 0, 100);
    //sw = map(zigYPos, 0, 600, mapStrokeResize1, mapStrokeResize2);

    strokeWeight(sw);
  }
  
  //void update(int i, int r, int g, int b, int zigSizeUpdate) {
  void update(int i, int r, int g, int b) {
  	
  	pushMatrix();
  	sw = map(zigYPos, 0, 600, 0, 100);
    //color strokeColor = color(r, g, b);
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
    
    // line(startX, zigYPos, 1, width, zigYPos, 1);
    line(startX, zigYPos, 1, width, zigYPos, 1);

    popMatrix();
  } 
} 

Scene rectangleMoveUp = new Scene("rectangleMoveUp", "Rectangle Move Up") {
  void setup() { rectangleMoveUp_setup(); }
  void draw() { rectangleMoveUp_draw(); }
};