// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/QLHMtE5XsMs

import processing.video.*;
import gab.opencv.*;

Capture video;
OpenCV opencv;

PImage prev;
//PImage prev, motion;
float threshold = 25;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

int videoScale = 10;
int cols, rows;

void setup() {

  size(640, 480, P3D);

  // Initialize columns and rows  
  cols = width / videoScale;
  rows = height / videoScale;

  // show which cameras available
  //String[] cameras = Capture.list();
  //printArray(cameras);

  // Construct the Capture object  
  video = new Capture(this, cols, rows, 15);
  video.start();

  prev = createImage(640, 480, RGB);
  //motion = createImage(640, 480, RGB);
}

void mousePressed() {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();

  timeTravel(motion());
}

void captureEvent(Capture video) {
}

void draw() {
  translate(-width/2.0, -height/2.0, height/2);
  background(0);
  //scale(0.5);

  //tint(255,50);
  //lights();
  //if (manyFrames[0] != null) {
  //  lightBulbs(manyFrames);
  //}

  // no.1 image from motion
  //translate(0, 0, 1);
  //image(motion(), 0, 0, motion().width/2.0, motion().height/2.0);

  // no.2 original video
  //translate(0, 0, 2);
  //image(video, 0, video.height);

  // no.3 the result i want
  //translate(video.width, 0, 3);
  //lightBulbs(manyFrames);

  // no.4 single frame light bulb
  //translate(0.0, video.height, 4);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; i++) {
      color c = video.get(i, j);
      currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

      int x = i * videoScale;
      int y = j * videoScale;

      strokeWeight(currWeight);
      stroke(#523939); 
      //stroke(pix);
      point(x + videoScale/2, y + videoScale/2);
    }
  }

//  camera(camX(), 0.0, camZ(), // eyeX, eyeY, eyeZ
//    0.0, 0.0, 0.0, // centerX, centerY, centerZ
//    0.0, 1.0, 0.0); // upX, upY, upZ
}
