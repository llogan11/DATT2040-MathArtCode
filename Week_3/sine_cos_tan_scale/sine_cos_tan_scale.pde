//warning: flashing light/strobing effect

//version 3 of sine_tan_scale.pde
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
    float wlen1 = 0.001;
    float w1 = sin(i*mv/wlen1)*5;
    
    //cosine wave
    float wlen2 = 0.05;
    float w2 = 1+cos(frameCount*0.0002*i+wlen2)*8;

    //tan wave
    float wlen3 = 0.001;
    float w3 = tan((frameCount/2*wlen3)/i/mv)+10;
    
    float waveadd = (w1*w2*w3)/2;

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
  //saveFrame("sine-cos-tan-scale-###.png");
}
