//modified from: TreeFractal.pde

float theta;   

float a = 45; 

void setup() {
  size(640, 640);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  
 // println(a);
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height/2);
  // Draw a line 120 pixels
  line(0,0,0,-height/8);
  // Move to the end of that line
  translate(0,-height/8);
  // Start the recursive branching! (outer branches)
  branch(100);
  
  //bottom part
  translate(0,height/8);
  line(0,height/8,0,0);
  translate(0, height/8);
  rotate(PI);
  branch(100);
  
  //left part
  translate(0,height/8);
  line(-width/8,0,width/8,0);
  translate(width/8, 0);
  rotate(HALF_PI);
  branch(100);
  
  //right part
  translate(0, (width/8)*2);
  rotate(PI);
  branch(100);
  
  //4 branches around the centre
  translate(0, height/8);
  branch(100);
  rotate(PI);
  branch(100);
  rotate(HALF_PI);
  branch(100);
  rotate(PI);
  branch(100);
}

void branch(float h) {
  // Each branch will be ~2/3rds the size of the previous one
  h *= 0.65;
  
  // All recursive functions must have an exit condition!!!!
  if (h > 5) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
  }
}

void mousePressed() {
  //saveFrame("snowflake-###.png");
}
