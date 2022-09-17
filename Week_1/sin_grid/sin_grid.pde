//press mouse to generate a new image

//modified from source: grid_sinstep.pde

int cols = 30;
int rows = 30;

int stepX, stepY;

float rv = 0.0;
float ranRot = 0.0;

void setup(){
  fill(255);
  noStroke();
  
  size(600, 600);
  stepX = (width / cols);
  stepY = (height / rows);
}

void draw(){
  background(0);
  
  //loop through rows and columns to determine step size and draw rectangles
  for(int y = 0; y < rows; y++){
    for(int x = 0; x < cols; x++){
      stepX = int(stepX + (sin(y + rv) * 10));
      
      //"horizontal" lines with random rotation
      rotate(ranRot);
      rect(x * stepX, y * stepY, stepX / 2, stepY / 2);
      rotate(-ranRot);
      
      //vertical lines ("L" shapes)
      rect(x * stepY, y * stepX, stepY / 5, stepX / 5);
      rect(x * stepY, y * stepX, stepX, stepY / 3);
    }
  }
}

void mousePressed(){
  rv = random(3);
  ranRot = random(-PI/3, PI/5);
  //saveFrame("sin-grid-###.png");
}
