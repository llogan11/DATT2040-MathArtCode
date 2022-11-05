//video chromakey crossing with image
//source: videofilter_2.pde

import processing.video.*;

Capture video;

PImage filter;
PImage img;
String imgName = "pressed.jpg";

void setup() {
  size(600, 600);

  filter = createImage(width, height, RGB);
  img = loadImage(imgName);
  //img = loadImage("bell.jpg");
  img.resize(600, 600);
  video = new Capture(this, width, height);

  video.start();
}

void draw() {

  if (video.available()) {
    video.read();

    filter.loadPixels();

    for (int i = 0; i < width*height; i++) {
      //1st filter
      if (imgName.equals("pressed.jpg")) {
        if (red(video.pixels[i]) > 70) { //if the red value is greater than 70
          filter.pixels[i] = video.pixels[i] + img.pixels[i]; //add video and image
        } else { //if not within the filter condition, colour black
          filter.pixels[i] = color(0);
        }
      } else { //2nd filter
        if (hue(video.pixels[i]) > 50) { //if the hue value is greater than 50
          filter.pixels[i] = (int)color(img.pixels[i]); //the filter adds image and colour
        } else { //if not within the filter condition, get remainder of video and image
          filter.pixels[i] = video.pixels[i] % img.pixels[i]; //video modulo image
        }
      }
    }

    filter.updatePixels();
  }

  image(filter, 0, 0);
}

void mousePressed() {
  //switch between the 2 images to filter
  if (imgName.equals("pressed.jpg")) {
    imgName = "bell.jpg";
  } else {
    imgName = "pressed.jpg";
  }
  img = loadImage(imgName);
  img.resize(600, 600);

  saveFrame("chromafilter-###.png");
}
