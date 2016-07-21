void stripes_setup() {
  smooth();
  ellipseMode(CENTER);
}

int ColorCode = 0;
float Stripe_Offset = 0;
float Window_Offset = 0;
int WindowCode = 0;

void stripes_draw() {
  int Stripe_Width = fader1;
  colorMode(HSB, 100);
  background(0);
  PVector v0;

  strokeWeight(3);
  stroke(0, 0, 0);



  for (int i=-1; i< 2400/Stripe_Width; i++) {

    if (abs(i-ColorCode)%2 == 0) {
      fill(((abs(i-ColorCode)*10))%100, 25, 100);
    } else {
      fill(0, 0, 0);
    }

    rect(i*Stripe_Width+Stripe_Offset, 0, Stripe_Width, 600);
  }  


  Stripe_Offset+=2;
  if (Stripe_Offset > Stripe_Width) {
    Stripe_Offset = 0;
    ColorCode++;
  }
}



void stripes2_setup() {
  colorMode(RGB);
}

int i_stripe;

void stripes2_draw() {

  noStroke();
  background(0, 20);
  fill(255, 255);

  //for (int i = 0; i < 125; i = i+1) {
  rect (i_stripe * width/125, 0, width/125, 600);
  //}
  i_stripe++;
  if (i_stripe > 125 ) {
    i_stripe = 0;
  }
}  

Scene stripes = new Scene("stripes", "Stripes") {
  void setup() {stripes_setup();}
  void draw() {stripes_draw();}
};