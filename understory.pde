import oscP5.*;
import netP5.*;

PImage wayHome;
boolean showWayHome;
boolean masterPause = false;

//int defaultPresetIndex = 1;
int currentPreset = 1;
  
OscP5 oscP5;
NetAddress myRemoteLocation;
NetAddressList myNetAddressList = new NetAddressList();

int myListeningPort = 12005;
/* the broadcast port is the port the clients should listen for incoming messages from the server*/
int myBroadcastPort = 12006;

import toxi.math.*;
import toxi.color.*;
import krister.Ess.*;

import java.util.*;
import megamu.mesh.*;

import processing.opengl.*;
import fisica.*;

PFont font;

FWorld world;
FBox remover;
FBox catcher;

import processing.video.*;

//char Mode='c';
Scene scene;
Scene tempScene;

//char TempMode;// = Mode;

//boolean sketchFullScreen() {
//  return true;
//}

HashMap<String, Scene> sceneMap = new HashMap<String, Scene>();
HashMap<String, Scene> OSCMap = new HashMap<String, Scene>();

void second_setup() {
  // Reset any relevant state here:
  resetShader();
  if (myMovie != null) {
    myMovie.stop();
  }
  
  if (scene != null) {
    //scene.loadPreset(1);
    //scene.loadPreset(0);
    
    if(autoload == 1.0){
      //print("AUTOLOAD! ");
      //println(autoload);
      scene.loadPreset(currentPreset);
    } else {
      scene.loadPreset(1);
    }
    
    scene.setup();
  }

  else println("Scene is null, not setting up");
}

void draw() {
  while (masterPause);{

    if (scene != null) scene.draw();
    else println("Scene is null");
    
    if(BlackFader > 0) {
      colorMode(RGB, 100);
      noStroke();
      resetShader();
      hint(DISABLE_DEPTH_TEST);
      fill(0, 0, 0, 100-BlackFader);
       
      rect(0, 0, 2400, 600);
      hint(ENABLE_DEPTH_TEST);
      BlackFader -- ;
    } else if (BlackFader == 0){
      colorMode(RGB, 100);
      noStroke();
      scene = tempScene;
      fill(0, 0, 0);
      rect(0, 0, 2400, 600);
      BlackFader -- ;
      background(0);
      second_setup();
     
    } else if (BlackFader > -100){
      colorMode(RGB, 100);
      noStroke();
      resetShader();
      hint(DISABLE_DEPTH_TEST);
      fill(0, 0, 0, 100+BlackFader);
      rect(0, 0, 2400, 600);
      hint(ENABLE_DEPTH_TEST);
      
      BlackFader--;
    }
    
    hint(DISABLE_DEPTH_TEST);
    resetShader();
    noStroke();
  
    float off = 230 - maskWipe/255.0*230;
  
    fill(0);
    beginShape();
    vertex(700, height);
    vertex(800, height-230);
    vertex(900, height);
    endShape();
    fill(0,0,0,255-maskFader);
  
    rect(0, height-off, width, height);
    
    if (showWayHome){
      image(wayHome, 20, 100, 2360, 250); 
      image(wayHome, 2400, 100); 
    }
    
  }
  
  hint(ENABLE_DEPTH_TEST);
  
}

void setup(){
  size(2400, 600, OPENGL);
  //size(1600, 900, OPENGL);
  // set location - needs to be in setup()
  // set x parameter depending on the resolution of your 1st screen
  //frame.setLocation(1660,50);

  oscP5 = new OscP5(this, myListeningPort);
  //myRemoteLocation = new NetAddress("169.254.178.242",12006);
   
  font = loadFont("UniversLT.vlw");
  wayHome = loadImage("logo-color.png");
  
  sceneMap.put("0", lineMaker);
  sceneMap.put("1", snowDown);
  sceneMap.put("2", bubbles);
  sceneMap.put("3", lines);
  sceneMap.put("4", spinners);
  sceneMap.put("5", vorenoi);
  sceneMap.put("6", delauney);
  sceneMap.put("7", spotlights);
  sceneMap.put("8", stripes);
  sceneMap.put("9", conway);
  sceneMap.put("c", cubes);
  sceneMap.put("v", treePattern4);
  sceneMap.put("b", treePattern5);
  //sceneMap.put("n", treePattern6);
  //sceneMap.put("m", treePattern7);
  sceneMap.put(",", treePattern8);
  
  sceneMap.put("y", clocks);
  
  sceneMap.put("a", AScene);
  sceneMap.put("d", DScene);
  sceneMap.put("e", EScene);
  sceneMap.put("f", FScene);
  sceneMap.put("g", GScene);
  sceneMap.put("h", HScene);
  sceneMap.put("i", IScene);
  sceneMap.put("j", JScene);
  sceneMap.put("k", KScene);
  sceneMap.put("l", LScene);
  //sceneMap.put("o", OScene);
  sceneMap.put("p", PScene);
  sceneMap.put("q", QScene);
  sceneMap.put("r", RScene);
  sceneMap.put("t", TScene);
  sceneMap.put("u", UScene);
  sceneMap.put("w", WScene);

  sceneMap.put("m", movie1);
  sceneMap.put("n", movie2);
  sceneMap.put("o", movie3);
  //sceneMap.put("p", movie4);
  sceneMap.put("q", movie5);
  sceneMap.put("r", movie6);
  
  sceneMap.put("1", colorMoireShader);

  // Sets the default scene to the junk rotating boxes
  scene = junk;
  
  OSCMap.put("/2/chooser/6/1", image2); 
  OSCMap.put("/2/chooser/6/2", DScene); 
  OSCMap.put("/2/chooser/6/3", EScene); 
  OSCMap.put("/2/chooser/6/4", GScene); 
  OSCMap.put("/2/chooser/6/5", HScene); 
  OSCMap.put("/2/chooser/6/6", IScene); 
  OSCMap.put("/2/chooser/6/7", JScene); 
  OSCMap.put("/2/chooser/6/8", KScene); 
  OSCMap.put("/2/chooser/6/9", LScene); 
  OSCMap.put("/2/chooser/6/10",FScene); 
  
  OSCMap.put("/2/chooser/5/1", OScene); 
  OSCMap.put("/2/chooser/5/2", PScene); 
  OSCMap.put("/2/chooser/5/3", QScene); 
  OSCMap.put("/2/chooser/5/4", RScene); 
  OSCMap.put("/2/chooser/5/5", TScene); 
  OSCMap.put("/2/chooser/5/6", UScene); 
  OSCMap.put("/2/chooser/5/7", WScene); 
  OSCMap.put("/2/chooser/5/8", YScene); 
  OSCMap.put("/2/chooser/5/9", image1); 
  OSCMap.put("/2/chooser/5/10",newLines); 

  OSCMap.put("/2/chooser/4/1", treePattern1); 
  OSCMap.put("/2/chooser/4/2", treePattern2); 
  OSCMap.put("/2/chooser/4/3", treePattern3); 
  OSCMap.put("/2/chooser/4/4", treePattern4); 
  OSCMap.put("/2/chooser/4/5", treePattern5); 
  OSCMap.put("/2/chooser/4/6", treePattern6); 
  OSCMap.put("/2/chooser/4/7", treePattern7); 
  OSCMap.put("/2/chooser/4/8", treePattern8); 
  OSCMap.put("/2/chooser/4/9", junk); 
  OSCMap.put("/2/chooser/4/10", conway);
 
  OSCMap.put("/2/chooser/3/1", complexShader); 
  OSCMap.put("/2/chooser/3/2", complex2Shader); 
  OSCMap.put("/2/chooser/3/3", twistyDotsShader); 
  OSCMap.put("/2/chooser/3/4", colorMoireShader); 
  OSCMap.put("/2/chooser/3/5", dotShader); 
  OSCMap.put("/2/chooser/3/6", wtfShader); 
  OSCMap.put("/2/chooser/3/7", doubledotShader); 
  OSCMap.put("/2/chooser/3/8", XVoronoi); 
  OSCMap.put("/2/chooser/3/9", donuts); 
  OSCMap.put("/2/chooser/3/10", donuts2); 

  OSCMap.put("/2/chooser/2/1", cubes); 
  OSCMap.put("/2/chooser/2/2", diags); 
  OSCMap.put("/2/chooser/2/3", snowDown); 
  OSCMap.put("/2/chooser/2/4", bubbles); 
  OSCMap.put("/2/chooser/2/5", lines); 
  OSCMap.put("/2/chooser/2/6", spinners); 
  OSCMap.put("/2/chooser/2/7", vorenoi); 
  OSCMap.put("/2/chooser/2/8", conway); 
  OSCMap.put("/2/chooser/2/9", stripes); 
  OSCMap.put("/2/chooser/2/10", delauney); 
  
  OSCMap.put("/2/chooser/1/1", movie1); 
  OSCMap.put("/2/chooser/1/2", movie2); 
  OSCMap.put("/2/chooser/1/3", movie3); 
  OSCMap.put("/2/chooser/1/4", movie4); 
  OSCMap.put("/2/chooser/1/5", movie5); 
  OSCMap.put("/2/chooser/1/6", movie6); 
  OSCMap.put("/2/chooser/1/7", movie7); 
  OSCMap.put("/2/chooser/1/8", movie8); 
  OSCMap.put("/2/chooser/1/9", movie9); 
  OSCMap.put("/2/chooser/1/10", movie10); 
  
  smooth();
  fill(0);
  strokeWeight(1);

  Ess.start(this);
  
  second_setup();
  
}

void contactStarted(FContact contact) {
  
  if (scene == RScene ) {

    // Draw in green an ellipse where the contact took place
    //     FBody b1;

    //FBody1 = contact.getBody1

    //   if(((FCircle)contact).getSize()<10){
    fill(255, 255, 255);
    strokeWeight(0);
    ellipse(contact.getX(), contact.getY(), 20, 20);


    if (contact.getBody1() instanceof FCircle && ((FCircle)contact.getBody1()).getSize()>6 || 
      contact.getBody2() instanceof FCircle && ((FCircle)contact.getBody2()).getSize()>6) {
      fill(100, 255, 100);
      ellipse(contact.getX(), contact.getY(), 50, 50);
    }
    
  }

  if (scene == UScene ) {

    // Draw in green an ellipse where the contact took place
    //     FBody b1;

    //FBody1 = contact.getBody1

    //   if(((FCircle)contact).getSize()<10){
    fill(255, 255, 255);
    strokeWeight(0);
    ellipse(contact.getX(), contact.getY(), 20, 20);


    if (contact.getBody1() instanceof FCircle && ((FCircle)contact.getBody1()).getSize()>6 || 
      contact.getBody2() instanceof FCircle && ((FCircle)contact.getBody2()).getSize()>6) {
      if (((FCircle)contact.getBody2()).getSize()>11 ||  ((FCircle)contact.getBody2()).getSize()>11) {
        fill(0, 255, 255);
      }
      else {
        fill(255, 0, 255);
      }
      ellipse(contact.getX(), contact.getY(), 50, 50);
      
    }
  }
  
}

//public void init() {
// //frame.removeNotify();
// //frame.setUndecorated(true); // works.
  
// // call PApplet.init() to take care of business
// super.init();
//} 