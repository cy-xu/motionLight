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
  size(640, 480);
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
}

void draw() {
  background(0);
  scale(0.5);
  
  motion();
  image(video, 0, video.height);
  pushMatrix();
  translate(video.width, 0);
  lightBulbs();
  translate(0.0, video.height);
  lightBulbs2();
  popMatrix();
}