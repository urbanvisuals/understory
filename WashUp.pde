// Wash up animation


PShape currentShape;


void washup_setup(){
  
  println("width", width);
  smooth();

}

void washup_draw(){
  

}



Scene washup = new Scene("wash up", "s: animations washing up the tree") {
  void setup() {
    washup_setup();
  }
  void draw() {
    washup_draw();
  }
};