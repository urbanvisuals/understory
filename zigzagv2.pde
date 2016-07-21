// Zigzag 
// need to loop this so it's not as repetative

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