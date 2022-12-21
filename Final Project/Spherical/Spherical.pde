import peasy.*;

PeasyCam cam;

SpherePoints ptsphere = new SpherePoints(1000);
SuperShape shape = new SuperShape(200, 50);
Orbit orbit = new Orbit();
Audio sound = new Audio();
Spiral spiral = new Spiral();
Concentric concentric = new Concentric();
Fractal cubes = new Fractal();

void settings() {
  size(600, 600, P3D);
}

void setup() {
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(100); //50
  cam.setMaximumDistance(600);
  cam.setCenterDragHandler(null);
  colorMode(RGB);
}

void draw() {
  background(180);
  noFill();

  sound.drawAudio();

  //draw supershape
  shape.drawShape(0.007, 0.006); //args rotations

  //draw sphere of points
  ptsphere.drawPoints();

  orbit.drawOrbit();

  spiral.drawSpiral();
  cubes.drawFractal();
  concentric.drawPlane();
}
void mousePressed() {
  saveFrame("spherical-###.png");
}
