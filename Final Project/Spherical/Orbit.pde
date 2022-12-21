class Orbit {
  
  void drawOrbit() {
    pushMatrix();
    rotateY(frameCount*0.06);
    rotateX(frameCount*0.07);

    translate(300-mouseX, 300-mouseY, 0);
    fill(255, 128, 0);
    strokeWeight(7);
    sphere(50);
    sphereDetail(4);
    popMatrix();
  }
  
}
