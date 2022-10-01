//warning: flashing light/strobing effect

//version 2 of sine_tan_scale.pde
//sources: lab3's scalable sine wave, addwaves_hack.pde

void setup() {
  size(800, 800);
}

float lx = -999, ly = -999;

void draw() {
  background(255);
  
  for (int i = 0; i < width; i++) {
    
    float mv = 0.0001; //scale is set to a constant
    
    //sine wave
    float wlen1 = 0.005;
    float w1 = sin(i*mv/wlen1)*50;
    
    //cosine wave
    float wlen2 = 0.001;
    float w2 = tan((frameCount*wlen2)/i/mv)-10;
    
    float waveadd = (w1*w2)/2;

    point(waveadd*i, height/2+waveadd);

    //keeps line nice
    if (lx < (width)-1) {
      line(waveadd*i, height/2+waveadd, lx, ly);
      lx = i;
      ly = height/2+waveadd;
    } else {
      lx = 0;
      ly = height/2;
    }
  }
}

void mousePressed(){
  //saveFrame("sine-tan-lines-###.png");
}
