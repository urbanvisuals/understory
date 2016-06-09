
Movie myMovie;

void movieEvent(Movie m) {
  m.read();
}


void movie1_setup() {
  myMovie = new Movie(this, "motion.mov");
  myMovie.play();
  myMovie.loop();
}

void movie2_setup() {
  myMovie = new Movie(this, "ground.mov");
  myMovie.play();
  myMovie.loop();
}

void movie3_setup() {
  myMovie = new Movie(this, "explosion.mov");
  myMovie.play();
  myMovie.loop();
}

void movie4_setup() {
  myMovie = new Movie(this, "WH-1_Circles.mp4");
  myMovie.play();
  myMovie.loop();
}

void movie5_setup() {
  myMovie = new Movie(this, "WH-3_SlashDots.mp4");
  myMovie.play();
  myMovie.loop();
}

void movie6_setup() {
  myMovie = new Movie(this, "WH-4_Whitestripes-1.mp4");
  myMovie.play();
  myMovie.loop();
}

void movie7_setup() {
  myMovie = new Movie(this, "WH-6_PatternB.mp4");
  myMovie.play();
  myMovie.loop();
}

void movie8_setup() {
  myMovie = new Movie(this, "WH-7A_ZigZags_TOP.mp4");
  myMovie.play();
  myMovie.loop();
}

void movie9_setup() {
  myMovie = new Movie(this, "WH-7B_ZigZags_BOT.mp4");
  myMovie.play();
  myMovie.loop();
}

void movie10_setup() {
  myMovie = new Movie(this, "WH-7C_ZigZags_ACTIVE.mp4");
  myMovie.play();
  myMovie.loop();
}


void movie_draw() {
  image(myMovie, 0, 0, 2400, 600);
    myMovie.speed((fader1/25.5));

}

void movie3_draw() {
  image(myMovie, 0, -150, 2400, 1000);
    float tempSpeed = (fader1/25.5)-5;
    if (tempSpeed == 0) tempSpeed = 0.1;
    myMovie.speed(tempSpeed);
    

}


Scene movie1 = new Scene("movie1", "Movie 1: Motion ") {
  void setup() {movie1_setup();}
  void draw() {movie_draw();}
};

Scene movie2 = new Scene("movie2", "Movie 2: Ground ") {
  void setup() {movie2_setup();}
  void draw() {movie_draw();}
};

Scene movie3 = new Scene("movie3", "Movie 3: explosion ") {
  void setup() {movie3_setup();}
  void draw() {movie3_draw();}
};

Scene movie4 = new Scene("movie4", "Movie 4: WH-1_Circles") {
  void setup() {movie4_setup();}
  void draw() {movie_draw();}
};

Scene movie5 = new Scene("movie5", "Movie 5: WH-3_SlashDots ") {
  void setup() {movie5_setup();}
  void draw() {movie_draw();}
};

Scene movie6 = new Scene("movie6", "Movie 6: WH-4_Whitestripes-1") {
  void setup() {movie6_setup();}
  void draw() {movie_draw();}
};

Scene movie7 = new Scene("movie7", "Movie 7: WH-6_PatternB ") {
  void setup() {movie7_setup();}
  void draw() {movie_draw();}
};

Scene movie8 = new Scene("movie8", "Movie 8: WH-7A_ZigZags_TOP") {
  void setup() {movie8_setup();}
  void draw() {movie_draw();}
};

Scene movie9 = new Scene("movie9", "Movie 9: WH-7B_ZigZags_BOT ") {
  void setup() {movie9_setup();}
  void draw() {movie_draw();}
};

Scene movie10 = new Scene("movie10", "Movie 10: WH-7C_ZigZags_ACTIVE") {
  void setup() {movie10_setup();}
  void draw() {movie_draw();}
};

