//sourced from: Lab2_vectorboundaries2.pde

//PVector methods used from reference: add(), dist(), mult(), rotate(), angleBetween()

PVector[] pos; //circle positions
PVector[] acc; //circle speeds/movements
PVector[] points; //centre points of circles
PVector[] colour; //circle colours

int num = 30; 
int speed = 4; 

void setup() {
  size(700, 700);

  pos = new PVector[num];
  acc = new PVector[num];
  points = new PVector[num];
  colour = new PVector[num];

  //populate
  for (int i = 0; i < num; i++) {
    pos[i] = new PVector(random(width), random(height), random(30, 70));
    acc[i] = new PVector(random(-speed, speed), random(-speed, speed), 0);
    points[i] = new PVector(pos[i].x, pos[i].y);
    colour[i] = new PVector(random(255), random(255), random(255));
  }

  background(0);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);

  for (int j = 0; j < num; j++) {
    //circle and its centre point move together
    pos[j].add(acc[j]);
    points[j].add(acc[j]);

    //x boundary check
    if (pos[j].x > width-(pos[j].z/2) || pos[j].x < pos[j].z/2)
      acc[j].x = acc[j].x * -1; // * -1 for reversing values

    //y boundary check
    if (pos[j].y > height-(pos[j].z/2) || pos[j].y < pos[j].z/2)
      acc[j].y = acc[j].y * -1;

    //circle colour: outline and fill
    stroke(colour[j].x, colour[j].y, colour[j].z);
    fill(255, 20);

    ellipse(pos[j].x, pos[j].y, pos[j].z+sin(pos[j].z*frameCount*0.001)*pos[j].z, pos[j].z+sin(pos[j].z*frameCount*0.001)*pos[j].z);
    
    //circles "interact" when their centre points are 100 pixels away
    for (int r = 0; r < num; r++) {
      if (points[j].dist(points[r]) < 100){
        //draw a line connecting the centres of the circles
        line(points[j].x, points[j].y, points[r].x, points[r].y);
        
        //multiply by -1 to move in the reverse acceleration vector
        acc[j].mult(-1);
        acc[r].mult(-1);
        
        //change colour
        colour[j].rotate(PVector.angleBetween(points[j], points[r])*0.1);
      }
    }
  }
  
}

void mousePressed() {
  for (int i = 0; i < num; i++) {
    pos[i] = new PVector(random(width), random(height), random(30, 70));
    acc[i] = new PVector(random(-speed, speed), random(-speed, speed), 0);
    points[i] = new PVector(pos[i].x, pos[i].y);
    colour[i] = new PVector(random(255), random(255), random(255));
  }
}
