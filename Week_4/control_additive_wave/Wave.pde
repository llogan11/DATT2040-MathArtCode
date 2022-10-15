// sourced from: Exercise_3_11_AdditiveWave.pde

class Wave {

  int xspacing;   // How far apart should each horizontal location be spaced
  int w;          // Width of entire wave
  int maxwaves;   // total # of waves to add together
  int h;          // canvas height

  float theta;
  float[] amplitude;   // Height of wave
  float[] dx;          // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;     // Using an array to store height values for the wave (not entirely necessary)

  Wave(int sizeW, int sizeH) {
    xspacing = 10;
    maxwaves = 5;
    theta = 0.0;
    amplitude = new float[maxwaves];
    dx = new float[maxwaves];
    h = sizeH;

    w = sizeW;
    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(10, 30);
      float period = random(100, 300); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }
    yvalues = new float[w/xspacing];
  }

  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.06;

    // Set all height values to zero
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = 0;
    }
    
    //Accumulate wave height values
    for (int j = 0; j < maxwaves; j++) {
      float x = theta;
      for (int i = 0; i < yvalues.length; i++) {
        //map height of wave to mouse location
        amplitude[j] = map(mouseY, 0, h, -30, 30);
        amplitude[j] += map(mouseX, 0, w, -30, 30);
        
        //direction of the wave depending on wave amplitude
        if (amplitude[j] > 0)
          x+=dx[j];  //+ left
        else
          x-=dx[j];  //- right
        
        // Every other wave is cosine instead of sine
        if (j % 2 == 0)  
          yvalues[i] += sin(x)*amplitude[j];
        else 
          yvalues[i] += cos(x)*amplitude[j];
      }
    }
  }

  void renderWave() {
    // A simple way to draw the wave with an ellipse at each location
    stroke(0);
    strokeWeight(5);
    for (int x = 0; x < yvalues.length; x++) {
      point(x*xspacing, h/2+yvalues[x]);
    }
    for (int x = 0; x < yvalues.length; x++) {  //group of waves in centre of canvas
      point(x*xspacing, height/2+yvalues[x]);
    }
  }
}
