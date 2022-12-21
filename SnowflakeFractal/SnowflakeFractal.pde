//TreeFractal.pde
 
float theta;   

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  
  float a = 0f;
  
  theta = radians(a);
  
  translate(width/2,height/1.5);
  
  translate(0,-120);
  
  branch(120);

}

void branch(float h) {
  
  h *= 0.66;
  
  if (h > 10) {
    pushMatrix();    
    rotate(theta);   
    line(0, 0, h/4, h/4);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
    rotate(HALF_PI);
    
    pushMatrix();
    rotate(theta);
    line(0, 0, h/4, h/4);
    translate(0, -h);
    branch(h);
    popMatrix();
    rotate(HALF_PI);
    
    pushMatrix();
    rotate(theta);
    line(0, 0, h/4, h/4);
    translate(0, -h);
    branch(h);
    popMatrix();
    rotate(HALF_PI);
    
    pushMatrix();
    rotate(theta);
    line(0, 0, h/4, h/4);
    translate(0, -h);
    branch(h);
    popMatrix();
    rotate(HALF_PI);
  }
}

//void mousePressed(){
//  saveFrame("snowflake-###.png");
//}
