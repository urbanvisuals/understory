import punktiert.math.Vec;
import punktiert.physics.*;


// world object
VPhysics physics;

// number of particles in the scene
int amount = 100;

void particleAttracts_setup(){
  colorMode(RGB, 255, 255, 255);
  background(0, 0, 0);
  size(2400, 600);
  fill(255,255,255);
  noStroke();
  
  physics = new VPhysics();
  physics.setfriction(.2f);

  for (int i = 0; i < amount; i++) {
    // val for arbitrary radius
    float rad = random(20, 60);
    // vector for position
    Vec pos = new Vec(random(rad, width - rad), random(rad, height - rad));
    // create particle (Vec pos, mass, radius)
    VParticle particle = new VParticle(pos, 2, rad);
    // add Collision Behavior
    particle.addBehavior(new BCollision());
    // add Local Attractor on each Particle (radius, strength)
    particle.addBehavior(new BAttractionLocal(rad*5, 1));
    // add particle to world
    physics.addParticle(particle);
  }
}

void particleAttracts_draw(){
  //background(255);
  colorMode(RGB, 255, 255, 255);
  background(red1, green1, blue1);
  fill(red2, green2, blue2);

  physics.update();

  for (VParticle p : physics.particles) {
    ellipse(p.x, p.y, p.getRadius() * 2, p.getRadius() * 2);
  }
}

Scene particleAttracts = new Scene("particleAttracts", "Particle Attracts") {
  void setup() { particleAttracts_setup(); }
  void draw() { particleAttracts_draw(); }
};