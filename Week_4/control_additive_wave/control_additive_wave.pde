// rows of points moving in waves. Mouse position changes waves direction & amplitude

Wave wave[];
int numWave = 5;

void setup() {
  size(800, 600);
  smooth();
  int h = height/10;
  wave = new Wave[numWave];
  for (int i = 0; i < numWave; i++) {
    wave[i] = new Wave(width, h);
    h += 250;
  }
}

void draw() {
  background(255);
  for (int i = 0; i < numWave; i++) {
    wave[i].calcWave();
    wave[i].renderWave();
  }
}

void mousePressed() {
  //saveFrame("control-additive-wave-###.png");
}
