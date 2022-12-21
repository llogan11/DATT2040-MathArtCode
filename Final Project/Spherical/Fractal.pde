//circularfractalpattern_2.pde (Week 6)

class Fractal {
  int r=150;
  int barWidth = 20;
  int lastBar = -1;

  void drawFractal() {
    
    float m = map(sin(frameCount*0.005), -1, 1, 0.1, 0.99);

    pushMatrix();

    scale(0.1);
    fractal(width, m);
    popMatrix();
  }

  void fractal(float s, float cutoff) {

    s *= cutoff;
    if (s > 1) {

      pushMatrix();
      translate(s*6, s*2);
      rotateX(map(mouseX, 0, width, 0, TWO_PI));
      rotateY(map(mouseY, 0, height, 0, TWO_PI));
      rotateZ(frameCount*0.05);
      
      rotate(radians(s));
      noFill();
      strokeWeight(35);
      stroke(15, mouseY/2, mouseX/2);
      box(s*4);
      popMatrix();

      fractal(s, cutoff);
    }
  }
}
