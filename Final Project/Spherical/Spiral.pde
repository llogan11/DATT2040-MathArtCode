//pearson_3dspiral.pde (Week 10)

class Spiral {
  int r = 300;

  void drawSpiral() {
    pushMatrix();
    rotateX(map(mouseX, 0, width, 0, TWO_PI));
    rotateY(map(mouseY, 0, height, 0, TWO_PI));

    float s = 0;
    float t = 0;
    float lastx = 0;
    float lasty = 0;
    float lastz = 0;

    while (t < 180) {
      s += 10;
      t += 1;
      float radianS = radians(s);
      float radianT = radians(t);
      float thisx = 0 + (r * cos(radianS) * sin(radianT));
      float thisy = 0 + (r * sin(radianS) * sin(radianT));
      float thisz = 0 + (r * cos(radianT));
      stroke(s, 62, t); 
      strokeWeight(3);
      if (lastx != 0) {
        line(thisx*cos(2), thisy*cos(2), thisz*tan(1), lastx, lasty, lastz);
      }
      
      lastx = thisx;
      lasty = thisy;
      lastz = thisz;
    }
    popMatrix();
  }
}
