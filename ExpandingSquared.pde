
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