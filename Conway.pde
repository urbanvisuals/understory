


int Conway_width = 80;
int Conway_height = 20;

//int Conway_width = 80;
//int Conway_height = 35;


int RectWidth = 1+ 2400/ Conway_width;
int RectHeight = 1+ 600/ Conway_height;



boolean[][] ConwayGrid = new boolean[Conway_width][Conway_height];
boolean[][] ConwayGrid_new = new boolean[Conway_width][Conway_height];
boolean[][] AllwaysAlive = new boolean[Conway_width][Conway_height];




void Populate() {
  for (int x=0; x< Conway_width; x++)
    for (int y=0; y< Conway_height; y++) {
      ConwayGrid[x][y] = random(10)<2;

      //if(PointInRect(WindowLocs[]) ){
      //AllwaysAlive[x][y] = random(20)<2;

      //}
    }
}

void conway_setup() {

  ellipseMode(CENTER);




  Populate();



  noStroke();
  // strokeWeight(2);
  // stroke(0,0,255);
}


int GetNcount(int x, int y) {
  int output = 0;


  if (x< Conway_width-1) {  //right

    if (ConwayGrid[x+1][y])
      output++;

    if (y< Conway_height-1 && ConwayGrid[x+1][y+1]) //bottom right
      output++;  

    if (y>0                 && ConwayGrid[x+1][y-1])//top right
      output++;
  }

  if (x>0             ) { //left
    if (ConwayGrid[x-1][y] )
      output++;

    if (y< Conway_height-1 && ConwayGrid[x-1][y+1]) //bottom left
      output++;  

    if (y>0                 && ConwayGrid[x-1][y-1] )//top left
      output++;
  }


  if (y< Conway_height-1 && ConwayGrid[x][y+1]) //bottom
    output++;  

  if (y>0 && ConwayGrid[x][y-1] )//top
    output++;  


  return output;
}

void conway_draw() {

  int x, y, n;
  colorMode(HSB, 100);
  background(0);



  //strokeWeight(1);
  //stroke(0,0,0);



  for (x=0; x< Conway_width; x++) {
    for (y=0; y< Conway_height; y++) {


      if (frameCount %fader2 == 1) {
        if (AllwaysAlive[x][y]) {
          n = 10;  
          ConwayGrid_new[x][y] = true;
        } else {

          n = GetNcount(x, y);
          if (ConwayGrid[x][y]) {
            if (n<2 || n>3)
              ConwayGrid_new[x][y] = false;
            //else
            //  ConwayGrid_new[x][y] = true;
          } else {//DEAD
            if (n==3)
              ConwayGrid_new[x][y] = true;
            // else
            //  ConwayGrid_new[x][y] = false;
          }
        }
      }
      if (ConwayGrid_new[x][y]) {
        fill(x%100, fader4/2.55f, 100);
        //  else
        //   fill(0,0,0);


        rect(RectWidth*x, RectHeight*y, RectWidth, RectHeight);

        /*
        pushMatrix();
         translate(RectWidth*x,RectHeight*y,0); 
         
         
         
         box(RectWidth-2,RectHeight-2,(RectWidth/3)*n);
         popMatrix() ;
         */
      }
    }
  }  

  boolean empty = true;

  for (x=0; x< Conway_width; x++) {
    for (y=0; y< Conway_height; y++) {
      ConwayGrid[x][y] = ConwayGrid_new[x][y];
      if (ConwayGrid[x][y])
        empty = false;
    }
  }

  if (empty)
    Populate();

  ConwayGrid[(int)random(Conway_width)][(int)random(Conway_height)] = true;
}

Scene conway = new Scene("conway", "9: Conway's game o life") {
  void setup() {
    conway_setup();
  }
  void draw() {
    conway_draw();
  }
};