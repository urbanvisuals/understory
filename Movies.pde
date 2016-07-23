
Movie myMovie;

void movieEvent(Movie m) {
  m.read();
}


void movie1_setup() {
  myMovie = new Movie(this, "Main.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie2_setup() {
  myMovie = new Movie(this, "line warpWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie3_setup() {
  myMovie = new Movie(this, "DripWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie4_setup() {
  myMovie = new Movie(this, "hypno patternWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie5_setup() {
  myMovie = new Movie(this, "django pattern_1WH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie6_setup() {
  myMovie = new Movie(this, "BlobWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie7_setup() {
  myMovie = new Movie(this, "Blue Red Diamond - ArkellsWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie8_setup() {
  myMovie = new Movie(this, "BeirutWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie9_setup() {
  myMovie = new Movie(this, "WH-7B_ZigZags_BOT.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie10_setup() {
  myMovie = new Movie(this, "WH-7C_ZigZags_ACTIVE.mp4");
  //myMovie = new Movie(this, "WH-7B_ZigZags_BOT.mp4");    //zig zag movie
  myMovie.play();
  myMovie.loop();
}

void movie11_setup() {
  myMovie = new Movie(this, "Zebra patternWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie12_setup() {
  myMovie = new Movie(this, "WH-6_PatternB.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie13_setup() {
  myMovie = new Movie(this, "WH-1_Circles.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie14_setup() {
  myMovie = new Movie(this, "Spinning red balls - Major LazerWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie15_setup() {
  myMovie = new Movie(this, "virusWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie16_setup() {
  myMovie = new Movie(this, "Polka Dots - Gary Clark Jr.WH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie17_setup() {
  myMovie = new Movie(this, "Pk wiggle LoopWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie18_setup() {
  myMovie = new Movie(this, "PaulS many ballsWH.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie19_setup() {
  myMovie = new Movie(this, "WH-7B_ZigZags_BOT.mp4");
  //myMovie = new Movie(this, "IMG_3368.m4v");
  myMovie.play();
  myMovie.loop();
}

void movie20_setup() {
  myMovie = new Movie(this, "WH-7C_ZigZags_ACTIVE.mp4");
  //myMovie = new Movie(this, "WH-7B_ZigZags_BOT.mp4");    //zig zag movie
  myMovie.play();
  myMovie.loop();
}





void movie_draw() {
  image(myMovie, 0, 0, 2400, 600);
  myMovie.speed((fader1/25.5));
}

void movie3_draw() {
  image(myMovie, 0, 0, 2400, 600);
  //float tempSpeed = (fader1/25.5)-5;
  //if (tempSpeed <= 0) tempSpeed = 0.1;
  //myMovie.speed(tempSpeed);
}


Scene movie1 = new Scene("movie1", "Movie 1: sinewave ") {
  void setup() {
    movie1_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie2 = new Scene("movie2", "Movie 2: WH PatternB") {
  void setup() {
    movie2_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie3 = new Scene("movie3", "Movie 3: WH-1_Circles") {
  void setup() {
    movie3_setup();
  }
  void draw() {
    movie3_draw();
  }
};

Scene movie4 = new Scene("movie4", "Movie 4: Rainbow Arrow") {
  void setup() {
    movie4_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie5 = new Scene("movie5", "Movie 5: PolkaDots ") {
  void setup() {
    movie5_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie6 = new Scene("movie6", "Movie 6: pauls balls") {
  void setup() {
    movie6_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie7 = new Scene("movie7", "Movie 7: hypno pattern ") {
  void setup() {
    movie7_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie8 = new Scene("movie8", "Movie 8: line warp-wayhome") {
  void setup() {
    movie8_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie9 = new Scene("movie9", "Movie 9: zigzag bottom") {
  void setup() {
    movie9_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie10 = new Scene("movie10", "Movie 10: zigzag top") {
  void setup() {
    movie10_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie11 = new Scene("movie11", "Movie 11: sinewave ") {
  void setup() {
    movie11_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie12 = new Scene("movie12", "Movie 12: WH PatternB") {
  void setup() {
    movie12_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie13 = new Scene("movie13", "Movie 13: WH-1_Circles") {
  void setup() {
    movie13_setup();
  }
  void draw() {
    movie3_draw();
  }
};

Scene movie14 = new Scene("movie14", "Movie 14: Rainbow Arrow") {
  void setup() {
    movie14_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie15 = new Scene("movie15", "Movie 15: PolkaDots ") {
  void setup() {
    movie15_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie16 = new Scene("movie16", "Movie 16: pauls balls") {
  void setup() {
    movie16_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie17 = new Scene("movie17", "Movie 17: hypno pattern ") {
  void setup() {
    movie17_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie18 = new Scene("movie18", "Movie 18: line warp-wayhome") {
  void setup() {
    movie18_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie19 = new Scene("movie19", "Movie 19: zigzag bottom") {
  void setup() {
    movie19_setup();
  }
  void draw() {
    movie_draw();
  }
};

Scene movie20 = new Scene("movie20", "Movie 10: zigzag top") {
  void setup() {
    movie20_setup();
  }
  void draw() {
    movie_draw();
  }
};