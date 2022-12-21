//Pvector_spherefrompoints.pde (Week 10)
//noise_example.pde (Week 2)

class SpherePoints {

  PVector points[];
  float factor = 0.015;
  float inc = 0;

  SpherePoints(int num) {
    points = new PVector[num];
    for (int i=0; i<points.length; i++) {
      points[i] = PVector.random3D().mult(250);
    }
  }
  
  void drawPoints() {
    
    float n;
    inc+= 0.006;
    
    for (int i = 0; i < points.length; i++) {
      strokeWeight(1.5+abs(sin(i*(points[i].z))*6));
      n = noise(i * factor, i * factor, inc) *  7.5;
      n = (n - int(n)) * 1;
      float cx = cos(n)*1.1;
      
      point(points[i].x * cx, points[i].y * cx, points[i].z * cx);

      
    }
  }
}
