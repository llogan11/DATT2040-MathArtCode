//press mouse to generate a new animation

float angleTan, angleSin;

float ranPosX, ranPosY;
float ranTransX, ranTransY;

int yInc = 30; 

void setup(){
  size(600, 600);
  noFill();
  stroke(0);
  frameRate(20); //slower framerate for tan rectangles
}

void draw(){
  background(255);
  
  //rectangles moving in tan wave function
  /* sourced from: https://processing.org/reference/tan_.html */
  for(int x = 0; x < width; x += 8){
    rect(x, ranPosY, x, width/3 + tan(angleTan)*8.0);
    angleTan += TWO_PI/50.0;
  }
  for(int x = width; x > 0; x -= 8){
    rect(x, height-ranPosY, x, width/3 + tan(angleTan)*8.0);
    angleTan += TWO_PI/50.0;
  }
  
  //offsetting rectangles growing and shrinking
  for(int y = 0; y < height; y += yInc){
    //rectangles start at a random x coordinate and at half height for y coordinate
    rect(ranPosX, height/2, y, yInc + sin(angleSin)*yInc);
    angleSin += PI*5;
    translate(ranTransX, ranTransY);
  }
  
  //reset angles to 0
  if(angleTan > TWO_PI*width*height || angleSin > TWO_PI*width*height){
    angleTan = 0.0;
    angleSin = 0.0;
  }
}

void mousePressed(){
  //random position coordinates
  ranPosX = random(width/6, width/1.2);
  ranPosY = random(0, height);
  
  //random translation values for sin rectangles
  ranTransX = random(-20, 20);
  ranTransY = random(-30, 10);
  
  //saveFrame("tan-sin-grid-###.png");
}
