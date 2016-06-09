PImage img;  // Declare variable "a" of type PImage

void image1_setup() {
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("pattern21.bmp");  // Load the image into the program  
}

void image1_draw() {
  // Displays the image at its actual size at point (0,0)

background(0);
pushMatrix();
translate(normX*width, normX*height);
rotate((fader1/255.0)*frameCount/20);
  image(img, -1200, -1080);
  
  popMatrix();
  
}

void image2_setup() {
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("pattern04.png");  // Load the image into the program  
}

void image2_draw() {
  // Displays the image at its actual size at point (0,0)

background(0);
pushMatrix();
translate(-(fader1/10.0 * frameCount) % 1920 ,0 );

image(img, 0, 0);
image(img, 1920, 0);
image(img, 3840, 0);
  
popMatrix();
  
}

Scene image1 = new Scene("image1", "image1") {
  void setup() {
    image1_setup();
  }
  void draw() {
    image1_draw();
  }
};

Scene image2 = new Scene("image2", "image2") {
  void setup() {
    image2_setup();
  }
  void draw() {
    image2_draw();
  }
};

