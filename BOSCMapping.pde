int oscX, oscY, fader1=10, fader2=10, fader3=10, fader4=10, fader5=10, fader6=10, red1=100, green1=100, blue1=100, red2=100, green2=100, blue2=100;
int maskFader = 255, maskWipe = 255;
float normX = 0.5;
float normY = 0.5;

float autoload;

void oscEvent(OscMessage theOscMessage) {

  /* check if the address pattern fits any of our patterns */
  connect(theOscMessage.netAddress().address());

  String addr = theOscMessage.addrPattern();
  print("addr: ");
  println(addr);
  String[] addrList = split(addr, '/');
  /* print the address pattern and the typetag of the received OscMessage */

  //  for (int i = 0; i < addrList.length ; i++){
  //    print(addrList[i]);  
  //    print("..");
  //  }
  //  println();

  if ((addr.startsWith("/2/chooser")) && (theOscMessage.get(0).floatValue() == 1)) {
    changeScene(OSCMap.get(addr));
    println("Change Scene");
  }

  if (theOscMessage.checkAddrPattern("/fader1")==true) {
    println("is this where it gets loaded?");
    fader1 = (int)theOscMessage.get(0).floatValue();
    if (fader1 == 0)
      fader1 = 1;
  }

  if (theOscMessage.checkAddrPattern("/fader2")==true) {
    fader2 = (int)theOscMessage.get(0).floatValue();
    if (fader2 == 0)
      fader2 = 1;
  }

  if (theOscMessage.checkAddrPattern("/fader3")==true) {
    fader3 = (int)theOscMessage.get(0).floatValue();
    if (fader3 == 0)
      fader3 = 1;
  }

  if (theOscMessage.checkAddrPattern("/fader4")==true) {
    fader4 = (int)theOscMessage.get(0).floatValue();
    if (fader4 == 0)
      fader4 = 1;
  }

  if (theOscMessage.checkAddrPattern("/fader5")==true) {
    fader5 = (int)theOscMessage.get(0).floatValue();
    if (fader5==0)
      fader5 = 1;
  }

  if (theOscMessage.checkAddrPattern("/fader6")==true) {
    fader6 = (int)theOscMessage.get(0).floatValue();
  }

  if (theOscMessage.checkAddrPattern("/maskfader")) {
    maskFader = int(theOscMessage.get(0).floatValue());
  }
  
  if (theOscMessage.checkAddrPattern("/maskwipe")) {
    maskWipe = int(theOscMessage.get(0).floatValue());
  }
  
  // RGB Faders
  if (theOscMessage.checkAddrPattern("/1/red1")) {
    red1 = int(theOscMessage.get(0).floatValue());
  }
  
  if (theOscMessage.checkAddrPattern("/1/green1")) {
    green1 = int(theOscMessage.get(0).floatValue());
  }
  
  if (theOscMessage.checkAddrPattern("/1/blue1")) {
    blue1 = int(theOscMessage.get(0).floatValue());
  }
  
  if (theOscMessage.checkAddrPattern("/1/red2")) {
    red2 = int(theOscMessage.get(0).floatValue());
  }
  
  if (theOscMessage.checkAddrPattern("/1/green2")) {
    green2 = int(theOscMessage.get(0).floatValue());
  }
  
  if (theOscMessage.checkAddrPattern("/1/blue2")) {
    blue2 = int(theOscMessage.get(0).floatValue());
  }
  
  // NOTE: SAVING notes 
  // It seems that the fader names coming from touchOSC were being used to control the
  // the saved preset value... so /load1 button would get the '1' from the button name in TouchOSC
  // and use that to save the sketch setting config to 'image-1'
  // at the moment i've set it so the 'name-#' is coming from the global `defaultPresetIndex` int which is stored in understory.pde
  // this is also the same functionality for the save function
  
  //if ((addr.startsWith("/load1")) && (theOscMessage.get(0).floatValue() == 1)) {
  if ((addr.indexOf("/load")) > 0  && (theOscMessage.get(0).floatValue() == 1)) {
    currentPreset = int(addr.substring(addr.length()-1));
    scene.loadPreset(int(addr.substring(addr.length()-1)));
    //scene.loadPreset(defaultPresetIndex);
    println("load");
  }

  //if ((addr.startsWith("/save1")) && (theOscMessage.get(0).floatValue() == 1)) {
  if ((addr.indexOf("/save")) > 0 && (theOscMessage.get(0).floatValue() == 1)) {
    currentPreset = int(addr.substring(addr.length()-1));
    scene.savePreset(int(addr.substring(addr.length()-1)));
    //scene.savePreset(defaultPresetIndex);
    println("save");
  }

  // Because this is a toggle, we want to know when it is either 0 || 1
  //if ((addr.startsWith("/autopreset/autopreset")) && (theOscMessage.get(0).floatValue() == 1)) {
  if ((addr.startsWith("/autoload"))) {
    print("autoload: ");
    println(addr);
    println(theOscMessage.get(0).floatValue());
    
    autoload = theOscMessage.get(0).floatValue();
    
    //scene.savePreset(int(addr.substring(addr.length()-1)));
  }

  if (addr.indexOf("/1/xy1") !=-1) { // the 8 X Y area
    oscY =  (int)((1-(theOscMessage.get(0).floatValue())) * 800);
    oscX =  (int)(theOscMessage.get(1).floatValue() * 1200);
    normY = theOscMessage.get(0).floatValue();
    normX = theOscMessage.get(1).floatValue();
    println("XY received");
    println("NormX, normY: " + normX + " " + normY);
  }

  //println(theOscMessage.addrPattern());
  //println(fader1 + " " + fader2 + " " + fader3 + " " + fader4 + " " + fader5 + " " + fader6);
  //println(oscX + " " + oscY);

  oscP5.send(theOscMessage, myNetAddressList);
}

private void connect(String theIPaddress) {
  if (!myNetAddressList.contains(theIPaddress, myBroadcastPort)) {
    myNetAddressList.add(new NetAddress(theIPaddress, myBroadcastPort));
    println("### adding "+theIPaddress+" to the list.");
    println("### currently there are "+myNetAddressList.list().size()+" remote locations connected.");
  } else {
    //println("### "+theIPaddress+" is already connected.");
  }
}

private void disconnect(String theIPaddress) {
  if (myNetAddressList.contains(theIPaddress, myBroadcastPort)) {
    myNetAddressList.remove(theIPaddress, myBroadcastPort);
    println("### removing "+theIPaddress+" from the list.");
  } else {
    println("### "+theIPaddress+" is not connected.");
  }
  println("### currently there are "+myNetAddressList.list().size());
}