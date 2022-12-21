//Concentric.pde (Week 10)

import peasy.org.apache.commons.math.geometry.*;

class Concentric {

  void drawPlane() {
    translate(-width/2, -width/2);
    rotateY(frameCount*0.05);
    rotateX(frameCount*0.05);
    rotateZ(frameCount*0.05);
    
    int np = 360;
    int layers = 10;
    int c_rad = 400;
    for (int layer = 0; layer < layers; layer++) {

      np = int(map(layer, 0, layers, random(2,5), 10));

      beginShape();
      for (int i = 0; i < np; i++) {

        float scaler = map(layer, 0, layers, 0, 1);

        float x = sin((i)*TWO_PI/np)*(c_rad*scaler);
        float y = cos((i)*TWO_PI/np)*(c_rad*scaler);
        float z = layer*1.1;
        pushMatrix();
        noFill();
        stroke(80, 255, 54);
        strokeWeight(1+abs(sin(i*(layer))*8));
        vertex(x, y, z);
        popMatrix();
        stroke(0);
      }
      endShape(CLOSE);
    }
  }
}
