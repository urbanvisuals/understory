
void pacingBalls_setup(){
  noStroke();
  fill(255, 204, 255); 
}

void pacingBalls_draw(){

}

Scene pacingBalls = new Scene("pacingBalls", "Pacing Balls") {
  void setup() { pacingBalls_setup(); }
  void draw() { pacingBalls_draw(); }
};