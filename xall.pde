/** SHADERS **/

class ShaderScene extends Scene {
  String shaderFile;
  PShader myShader;
  ShaderScene(String id, String name, String shaderFile) {
    super(id, name);
    this.shaderFile = shaderFile;
  }
  void setup() {
    // set location - needs to be in setup()
   //size(2420, 600, OPENGL);
   //size(displayWidth, displayHeight, OPENGL);
    myShader = loadShader(shaderFile);
  }
  
  void draw() {
    background(0);
    //println(millis());
    myShader.set("time", float(millis()));
    myShader.set("mouse", float(oscX), float(oscY));
    myShader.set("norm", normX, normY);
    myShader.set("fader1", float(fader1));
    myShader.set("fader2", float(fader2));
    myShader.set("fader3", float(fader3));
    myShader.set("fader4", float(fader4));
    myShader.set("fader5", float(fader5));
    myShader.set("fader6", float(fader6));
    myShader.set("screen", float(width), float(height));
    shader(myShader, TRIANGLES);
    rect(0, 0, width, height);
  }
}
Scene complexShader = new ShaderScene("complexshader", "Shader: Complex 1 (solid)", "complex.glsl");
Scene complex2Shader = new ShaderScene("complexshader2", "Shader: Complex 2 (outlines)", "complex2.glsl");
Scene twistyDotsShader = new ShaderScene("twistydotsshader", "Shader: Twisty dots", "twistydots.glsl");
Scene doubledotShader = new ShaderScene("doubledotshader", "Shader: Double dots", "doubledot.glsl");

Scene colorMoireShader = new ShaderScene("colormoireshader", "Shader: Colour Moire", "colormoire.glsl");
Scene dotShader = new ShaderScene("dotshader", "Shader: Dots", "dots.glsl");
Scene doughnutShader = new ShaderScene("doughnutshader", "Shader: Dots", "doughnuts.glsl");
Scene wtfShader = new ShaderScene("wtfshader", "Shader: WTF", "wtf.glsl");

/** ISO CUBES **/

Scene cubes = new Scene("cubes", "Cubes scene") {
  float[][] cubeD;
  float[][] cubeV;
  
  int cubeSize;
  int countX;
  int countY;
  int cubeH;
  float ratio = sqrt(3.0)/2.0;
  
  void initCubes(int size) {
    cubeSize = size;
    cubeH = size*20;
    countX = width/size + 1;
    countY = int(height/size/ratio + 2);
    cubeD = new float[countY][countX];
    cubeV = new float[countY][countX];
    for (int x = 0; x < countX; x++) {
      for (int y = 0; y < countY; y++) {
        cubeD[y][x] = 0;
        cubeV[y][x] = 0;
      }
    }
  }
  
  void drawCubes() {
    pushMatrix();
    colorMode(HSB, 255);
    randomSeed(16);

    for (int yi = 0; yi < countY; yi++) {
      for (int xi = 0; xi < countX; xi++) {
          int hue = int(random(255.0));
          float dx = xi*cubeSize;
          float dy = yi*cubeSize*ratio;
          float offset = cubeD[yi][xi];
          float offHue = (hue + offset * fader5 * 0.05);
          if (offHue > 0) offHue %= 255;
          if (offHue < 0) offHue = 255 - (-offHue % 255);
          
          dx += yi%2 * cubeSize/2;
          dy += offset;
          
          pushMatrix();
          translate(dx, dy);
          
          beginShape();
          fill(offHue, fader4, 255);
          noStroke();
          vertex(-cubeSize/2, -cubeSize/4);
          vertex(0, -cubeSize/2);
          vertex(cubeSize/2, -cubeSize/4);
          vertex(0,0);
          endShape();        
          
          beginShape();
          fill(offHue, fader4, 160);
          vertex(0,0);
          vertex(cubeSize/2, -cubeSize/4);
          vertex(cubeSize/2, cubeSize/4 + cubeH);
          vertex(0, cubeSize/2 + cubeH);
          endShape();
          
          beginShape();
          fill(offHue, fader4, 0);
          vertex(0,0);
          vertex(0, cubeSize/2 + cubeH);
          vertex(-cubeSize/2, cubeSize/4 + cubeH);
          vertex(-cubeSize/2, -cubeSize/4);
          endShape();
          
          popMatrix();
      }
    } 
    popMatrix();
  }
  
  void stepCubes() {
    for (int yi = 0; yi < countY; yi++) {
      //println("Y: " + yi);
      for (int xi = 0; xi < countX; xi++) {
        float d = cubeD[yi][xi];
        float f = 0.0;
        
        int x00 = xi-1, y00 = yi-1;
        int x10 = xi,   y10 = yi-1;
        int x01 = xi-1, y01 = yi+1;
        int x11 = xi,   y11 = yi+1;
        if (yi%2 == 1) {
          x00++; x01++; x10++; x11++;
        }
        if (x00 >= 0 && y00 >= 0) {
          f += cubeD[y00][x00] - d;
        }
        if (x01 >= 0 && y01 < countY) {
          f += cubeD[y01][x01] - d;
        }
        if (x10 < countX && y10 >= 0) {
          f += cubeD[y10][x10] - d;
        }
        if (x11 < countX && y11 < countY) {
          f += cubeD[y11][x11] - d;
        }
        f -= cubeD[yi][xi]*0.05;
        cubeV[yi][xi] += f;
        cubeV[yi][xi] *= 0.97;
      } 
    }
    for (int yi = 0; yi < countY; yi++) {
      for (int xi = 0; xi < countX; xi++) {
        cubeD[yi][xi] += cubeV[yi][xi]*0.02;
      } 
    }
  }
  
  void setup() {
    //size(displayWidth, displayHeight, OPENGL);
    initCubes(64);
  }
  
  float tSin = 0.0;
  void draw() {
    colorMode(RGB, 255);
    background(0);
    stepCubes();
    tSin += fader2;
    int whichX = min(int(normX*countX), countX-1);
    int whichY = min(int(normY*countY), countY-1);
    cubeD[whichY][whichX] = fader3 * sin(tSin/1000.0);
    drawCubes();
  }
};

/** DIAGS **/
Scene diags  = new Scene("diags", "Diags scene") {
  float p[][];
  float v[][];
  int target = 0;
  int boxSize;
  
  int countX;
  int countY;
  
  void initDiags(int size) {
    boxSize = size;
    print("WIDTH: " + width);
    countX = width/boxSize;
    countY = height/boxSize;
    p = new float[countY][countX];
    v = new float[countY][countX];
    for (int x = 0; x < countX; x++) {
      for (int y = 0; y < countY; y++) {
        v[y][x] = 0;
        p[y][x] = 0;
      }
    }
  }
  
  void step() {
    for (int x = 0; x < countX; x++) {
      for (int y = 0; y < countY; y++) {
        float f = 0.0;
        if (x > 0) {
          f += p[y][x-1];
        }
        if (y > 0) {
          f += p[y-1][x];
        }
        if (x < countX-1) {
          f += p[y][x+1];
        }
        if (y < countY - 1) {
          f += p[y+1][x];
        }
        f -= 4*p[y][x];
        v[y][x] += f;
        v[y][x] *= 0.97;
      }
    }
    for (int x = 0; x < countX; x++) {
      for (int y = 0; y < countY; y++) {
        p[y][x] += v[y][x]*0.01;
      }
    }
  }
  
  float expit(float x) {
    if (x < 0) {
      x = exp(x);
      return x / (1.f + x);
    }
    else {
      return 1.f / (1.f + exp(-x));
    }
  }
  void paint() {
    colorMode(RGB, 255);
    stroke(255);
    strokeWeight(fader1/10.0);
    strokeCap(ROUND);
    for (int xi = 0; xi < countX; xi++) {
      for (int yi = 0; yi < countY; yi++) {
        float x = xi*boxSize;
        float y = yi*boxSize;
        float thisP = p[yi][xi];
        float theta = atan(thisP)/2;
        
        pushMatrix();
        translate(x,y);
        rotate(theta);
  
        line(0, boxSize/2, 0, -boxSize/2);
        popMatrix();
      }
    }
  }
  
  void setup() {
    //size(displayWidth, displayHeight, OPENGL);
    initDiags(64);
    //p[10][10] = 100;
  }
  
  float tSin = 0.0;
  void draw() {
    background(0);
    step();
    tSin += fader2;
    int whichX = int(normX*countX);
    int whichY = int(normY*countY);
    p[whichY][whichX] = fader3 * sin(tSin/1000.0);
    paint();
  }
};

Scene doughnuts = new Scene("doughnuts", "Doughnuts") {
  int countX, countY;
  void setup() {
    countX = width/64; countY = height/64;
  }
  
  void draw() {
    background(0);
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipseMode(CENTER);
    for (int xi = 0; xi < countX; xi++) {
      for (int yi = 0; yi < countY; yi++) {
        for (int ringI = 0; ringI < 10; ringI++) {
          float r = 20*tan(millis()/10000.0 + ringI/10.0);
          //r = 10.0;
          if (r > 0 && r < 200) {
            ellipse(xi * width / countX, yi * height / countY, r, r);
          }
        }
      }
    }
  }
};

PApplet app = this;
Scene XVoronoi = new Scene("xvoronoi", "XVoronoi") {
  PShader stripeShader;
  void setup() {
    Fisica.init(app);
  
    world = new FWorld();
    world.setGravity(0, 0);
  
    stripeShader = loadShader("midstripe.glsl");
  
  
    FCircle b;
    for (int i=0; i< 125; i++) {
  
      b = new FCircle(50);
  
  
      b.setDrawable(false);
      b.setPosition(random(2400), random(600));
      b.setStroke(0);
      b.setStrokeWeight(0);
      b.setFill(255);
      b.setDamping(0);
      b.setFriction(0);
      b.setRestitution(1);
      b.setVelocity(random(-100, 100), random(-100, 100));
      world.add(b);
    }
  }
  
  void draw() {
    colorMode(RGB, 255);
    background(0);
  
    ArrayList BodyList = world.getBodies();
  
    int alength = BodyList.size();
    float[][] points = new float[alength][2];
  
    FBody present;
    int k = 0;
    int m = 0;
  
    for (int i=0; i < BodyList.size (); i++) {
      present = (FBody)BodyList.get(i);
  
  
      if (present instanceof FCircle) {//ball
  
        if (present.getX() < 0) {
          present.setPosition(0, present.getY());
          present.setVelocity(-present.getVelocityX(), present.getVelocityY());
        }
  
  
        if (present.getX() > 2400) {
          present.setPosition(2400, present.getY());
          present.setVelocity(-present.getVelocityX(), present.getVelocityY());
        }
  
  
        if (present.getY() < 0) {
          present. setPosition(present.getX(), 0);
          present.setVelocity(present.getVelocityX(), -present.getVelocityY());
        }
  
        if (present.getY() > 600) {
          present. setPosition(present.getX(), 600);
          present.setVelocity(present.getVelocityX(), -present.getVelocityY());
        }
  
        points[m][0] = present.getX()+i;
        points[m][1] = present.getY()+i;
        m++;
      }
    }
  
    stripeShader.set("time", float(millis()));
    stripeShader.set("mouse", float(oscX), float(oscY));
    stripeShader.set("norm", normX, normY);
    println("Fader1: " + fader1);
    stripeShader.set("fader1", float(fader1));
    stripeShader.set("fader2", float(fader2));
    stripeShader.set("fader3", float(fader3));
    stripeShader.set("fader4", float(fader4));
    stripeShader.set("fader5", float(fader5));
    stripeShader.set("fader6", float(fader6));
    stripeShader.set("screen", float(width), float(height));
  
    try {
      Voronoi myVoronoi = new Voronoi( points );
  
  
      MPolygon[] myRegions = myVoronoi.getRegions();
  
  
      //stroke(0, 0, 0);
      noStroke();
      strokeWeight(fader1/4);
      shader(stripeShader);
      
      for (int i=0; i<myRegions.length; i++)
      {
        // an array of points
        float[][] regionCoordinates = myRegions[i].getCoords();
  
        float centroidX = 0.f, centroidY = 0.f;
        for (int coordI = 0; coordI < regionCoordinates.length; coordI++) {
          centroidX += regionCoordinates[coordI][0];
          centroidY += regionCoordinates[coordI][1];
        }
        centroidX /= regionCoordinates.length;
        centroidY /= regionCoordinates.length;
  
        for (int coordI = 0; coordI < regionCoordinates.length; coordI++) {
          // hack, encoding direction to centroid in the UV
          float vax = regionCoordinates[coordI][0];
          float vay = regionCoordinates[coordI][1];
          
          float vbx = regionCoordinates[(coordI+1) % regionCoordinates.length][0];
          float vby = regionCoordinates[(coordI+1) % regionCoordinates.length][1];
          
          float dvx = vbx - vax;
          float dvy = vby - vay;
          
          float ldv = mag(dvx, dvy);
          
          float dCx = centroidX - vax;
          float dCy = centroidY - vay;
          
          float dot = dCx * dvx/ldv + dCy * dvy / ldv;
          
          float midx = vax + dvx/ldv*dot;
          float midy = vay + dvy/ldv*dot;
//          pushMatrix();
//          translate(0,0,1);
//          ellipse(midx, midy, 20, 20);
//          popMatrix();
          
          float u = centroidX - midx;
          float v = centroidY - midy;
          beginShape(TRIANGLE);
          vertex(vax, vay, u, v);
          vertex(centroidX, centroidY, 0, 0);
          vertex(vbx, vby, u, v);
          endShape();
//          ellipse(centroidX, centroidY, 10, 10);
        }
        //myRegions[i].draw(this); // draw this shape
        //fill(0, 0, 0);
  
        //   textSize(18); 
  
        //   text((i+1), points[i][0]-20, points[i][1]-0);
      }
    }  
    catch (Exception e) {
      e.printStackTrace();
    }
  
    world.step(1.0/200);
    //world.draw();
    //println(world.getBodies());
  }
};



