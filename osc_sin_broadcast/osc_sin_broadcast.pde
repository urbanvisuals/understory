import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

boolean f1, f2, f3, f4, f5, f6;
boolean r1, g1, b1, r2, g2, b2;

float angle = 0.0;
float angleColor1 = random(0.0, 255);
float angleColor2 = random(0.0, 255);
float speed = 0.001;
float angleOffset = 0.0;

float speedIncrease = 0.0001;

void setup() {
  background(0);
  size(600, 800);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("192.168.0.100",12005);
}

void draw() {
  background(0);

  OscMessage myMessage;
  
  float c1 = (sin(angleColor1) * 255/2) + 255/2;
  float c2 = (sin(angleColor2) * 255/2) + 255/2;
  float oscColor1 = c1;
  float oscColor2 = c2;
  
  // For fader vals
  float y1 = (sin(angle) * 100/2) + 100/2;
  float oscSend = y1;
  //println(oscSend);
  
  if(f1){
    myMessage = new OscMessage("/fader1");
    myMessage.add(oscSend);
    println("F1 Value: " + f1);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(f2){
    myMessage = new OscMessage("/fader2");
    myMessage.add(oscSend);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(f3){
    myMessage = new OscMessage("/fader3");
    myMessage.add(oscSend);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(f4){
    myMessage = new OscMessage("/fader4");
    myMessage.add(oscSend);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(f5){
    myMessage = new OscMessage("/fader5");
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(f6){
    myMessage = new OscMessage("/fader6");
    myMessage.add(oscSend);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  // COLOR
  if(r1){
    myMessage = new OscMessage("/1/red1");
    myMessage.add(oscColor1);
    println("F1 Value: " + f1);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(g1){
    myMessage = new OscMessage("/1/blue1");
    myMessage.add(oscColor1);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(b1){
    myMessage = new OscMessage("/1/green1");
    myMessage.add(oscColor1);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(r2){
    myMessage = new OscMessage("/1/red2");
    myMessage.add(oscColor2);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(g2){
    myMessage = new OscMessage("/1/green2");
    myMessage.add(oscColor2);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if(b2){
    myMessage = new OscMessage("/1/blue2");
    myMessage.add(oscColor2);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  textSize(14);
  text("'n' will reset and randomize the sine wave for the fader and color controls", 40, 15);
  
  textSize(28);
  int gap = 40;
  text("BROADCASTING", 80 , gap);
  text("Angle     " + angle, 80 , gap * 2);
  text("Speed     " + speed, 80 , gap * 3);
  text("oscSend  " + oscSend, 80 , gap * 4);
  text("Color 1  " + oscColor1, 80 , gap * 5);
  text("Color 2  " + oscColor2, 80 , gap * 6);
  text("-------- ", 80 , gap * 7);
  text("Fader1   " + f1, 80 , gap * 8);
  text("Fader2   " + f2, 80 , gap * 9);
  text("Fader3   " + f3, 80 , gap * 10);
  text("Fader4   " + f4, 80 , gap * 11);
  text("Fader5   " + f5, 80 , gap * 12);
  text("Fader6   " + f6, 80 , gap * 13);
  text("-------- ", 80 , gap * 14);
  text("Red1     " + r1, 80 , gap * 15);
  text("Blue1    " + g1, 80 , gap * 16);
  text("Green1     " + b1, 80 , gap * 17);
  text("Red2     " + r2, 80 , gap * 18);
  text("Blue2    " + g2, 80 , gap * 19);
  text("Green2     " + b2, 80 , gap * 120);
  
  angle += speed;
  angleColor1 += speed;
  angleColor2 += speed;
  
}

void keyPressed() {
  if (key == '1') {
    f1 =! f1;
  } else if (key == '2') {
    f2 =! f2;
  } else if (key == '3') {
    f3 =! f3;
  } else if (key == '4') {
    f4 =! f4;
  } else if (key == '5') {
    f5 =! f5;
  } else if (key == '6') {
    f6 =! f6;
  } else if (key == 'q') { // red1
    r1 =! r1;
  } else if (key == 'w') { // green1
    g1 =! g1;
  } else if (key == 'e') { // blue1
    b1 =! b1;
  } else if (key == 'a') { // red2
    r2 =! r2;
  } else if (key == 's') { // green2
    r2 =! r2;
  } else if (key == 'd') { // blue2
    r2 =! r2;
  } else if(key == 'n'){
    angle = random(0.0, 100.0);
    angleColor1 = random(0.0, 255);
    angleColor2 = random(0.0, 255);
  }
  
  if (key == ';') {
    speed -= 0.0001;
    angleColor1 -= speedIncrease;
    angleColor2 -= speedIncrease;
  } else if (key == '\'') {
    speed += 0.0001;
    angleColor1 += speedIncrease;
    angleColor2 += speedIncrease;
  }
}