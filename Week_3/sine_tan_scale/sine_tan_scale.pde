//warning: flashing light/strobing effect

//sources: lab3's scalable sine wave, addwaves_hack.pde

void setup() {
  size(800, 800);
}

float lx = -999, ly = -999;

void draw() {
  background(255);
  
  for (int i = 100; i < width-100; i++) {
    
    //scale to mouse on x axis
    float mv = map(mouseX, 0, width, 0.0001, 0.0004);
    
    //sine wave
    float wlen1 = 0.01;
    float w1 = sin(i*mv/wlen1)*50;
    
    //cosine wave
    float wlen2 = 0.01;
    float w2 = tan((frameCount*wlen2)/i/mv)-10;
    
    float waveadd = (w1*w2)/2;

    point(i, height/2+waveadd);

    //keeps line nice
    if (lx < (width-100)-1) {
      line(i, height/2+waveadd, lx, ly);
      lx = i;
      ly = height/2+waveadd;
    } else {
      lx = 100;
      ly = height/2;
    }
  }
}

void mousePressed(){
  //saveFrame("sine-tan-scale-###.png");
}
