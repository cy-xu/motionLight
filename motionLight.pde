// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/QLHMtE5XsMs

import processing.video.*;
import gab.opencv.*;

Capture video;
OpenCV opencv;

PImage prev, motion;
float threshold = 25;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

void setup() {

  size(640, 480, P3D);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 640, 480, 30);
  video.start();

  prev = createImage(640, 480, RGB);
  motion = createImage(640, 480, RGB);
}

void mousePressed() {
}

void captureEvent(Capture video) {

  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();

  motion();
  timeTravel(motion);
}

void draw() {
  translate(-width/2.0, -height/2.0, height/2);
  background(0);
  //scale(0.5);

  //tint(255,50);
  lights();
  if (manyFrames[0] != null) {
    lightBulbs(manyFrames);
  }

  //translate(0, 0, 1);
  //motion();
  //translate(0, 0, 2);
  //image(video, 0, video.height);
  //translate(video.width, 0, 3);
  //lightBulbs();
  //translate(0.0, video.height, 4);
  //lightBulbs2();

  camera(camX(), 0.0, camZ(), // eyeX, eyeY, eyeZ
    0.0, 0.0, 0.0, // centerX, centerY, centerZ
    0.0, 1.0, 0.0); // upX, upY, upZ
}