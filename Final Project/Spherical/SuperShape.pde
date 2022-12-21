//Daniel Shiffman/The Coding Train, Coding Challenge #25, 26

class SuperShape {
  float r;
  int total;
  PVector[][] globe;
  float lon;
  
  float m=0;
  float n1=0.2;
  float n2=1.7;
  float n3=1.7;
  
  SuperShape(float radius, int num) {
    total = num;
    r = radius;
    globe = new PVector[total+1][total+1];
  }

  float a=1;
  float b=1;
  
  float supershape(float theta, float m, float n1, float n2, float n3) {
    float t1 = abs((1/a)*cos(m*theta/4));
    t1 = pow(t1, n2);
    float t2 = abs((1/b)*sin(m*theta/4));
    t2 = pow(t2, n3);
    float t3=t1+t2;
    float r = pow(t3, -1/n1);
    return r;
  }

  float offset = 0;
  
  void drawShape(float rot1, float rot2) {
    rotateY(frameCount*rot1);
    rotateX(frameCount*rot2);
    
    //draw supershape
    m=map(mouseX, -50, 50, 6, 10);
    n1=map(mouseY, -50, 50, 0.2, 1);
    n2=map(mouseX, -50, 50, 1.7, 0.2);
    n3=map(mouseY, -50, 50, 1.7, 2.5);
    
    for (int i=0; i<total+1; i++) {
      float lat = map(i, 0, total, -HALF_PI, HALF_PI);
      float r2 = supershape(lat, m, n1, n2, n3);//
      for (int j=0; j<total+1; j++) {
        lon = map(j, 0, total, -PI, PI);
        float r1 = supershape(lon, m, n1, n2, n3);//
        float x = r * r1 * cos(lon) * r2 * cos(lat);
        float y = r * r1 * sin(lon) * r2 * cos(lat);
        float z = r * r2 * sin(lat);
        globe[i][j] = new PVector(x, y, z);
      }
    }
    
    //colour & faces
    offset+=5;
    
    for (int i=0; i<total; i++) {
      float hue = map(i,0, total, 0, 255*1);
      float col1 = map(mouseX, 0, width, 0, 255);
      float col2 = map(mouseY, 0, height, 255, 0);
      fill((hue+offset)%255, col1, col2);

      beginShape(TRIANGLE_STRIP);
      for (int j=0; j<total+1; j++) {
        PVector v1 = globe[i][j];
        strokeWeight(0);
        
        vertex(v1.x, v1.y, v1.z);
        PVector v2 = globe[i+1][j];
        vertex(v2.x, v2.y, v2.z);
      }
      endShape();
    }
  }
  
  
}
