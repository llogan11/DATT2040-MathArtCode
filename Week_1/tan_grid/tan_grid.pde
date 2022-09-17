//press mouse to generate a new animation

//second version of tan_sin_grid.pde

float ranPosY;  //random position for rectangles
float angleTan;  //angle for tan function
float rectHeight;  //size of rectangles
float lineDist;  //movement of lines

void setup(){
  size(600, 600);
  noFill();
  stroke(0);
  frameRate(8);
}

void draw(){
  background(255);
  
  //rectangles moving in tan wave function
  for(int x = 0; x < width; x += 8){
    rect(x, ranPosY, x, rectHeight);
    
    for(int y = height; y > 0; y -= 8){
      rect(y, height-ranPosY, y, rectHeight);
      
      //update the angles and sizes
      angleTan += TWO_PI/50.0;
      rectHeight = width/3 + tan(angleTan)*8.0;
      lineDist = width/3 + tan(angleTan);
      
      //vertical lines moving towards the left
      rotate(PI/2);
      for(int j = 0; j < height/12; j += 8){
        line(height, lineDist, j, lineDist);
      }
      rotate(-(PI/2));
    }
  }
  
  //reset angle to 0
  if(angleTan > TWO_PI*width*height)
    angleTan = 0.0;
  
}

void mousePressed(){
  //random Y position coordinate for tan rectangles
  ranPosY = random(-height/2, height);
  
  //saveFrame("tan-grid-###.png");
}
