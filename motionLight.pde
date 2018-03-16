import processing.video.*;
import processing.sound.*;
//import gab.opencv.*;
//import peasy.PeasyCam;

Capture video;
AudioIn input;
Amplitude rms;
//OpenCV opencv;
//PeasyCam cam;

int frameNom = 10;
int videoScale = 20; // Size of each cell in the grid
int audioScale = 20;
int cols, rows, wwidth = 1280, hheight = 720; // Number of columns and rows in the system
int playMode = 0;
int tempSecond, bmp = 117, bmpMillis, passDownTemp;
float minWeight = videoScale * 0.05;
float maxWeight = videoScale * 0.75;
float threshold = videoScale * 0.6;
color strokeC;

PImage prev, output;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

void setup() {
  size(1280, 720);
  //size(full);
  //cam = new PeasyCam(this, 600);

  // show which cameras available
  //String[] cameras = Capture.list();
  //printArray(cameras);

  // Initialize columns and rows  
  cols = int(width / videoScale);
  rows = int(height / videoScale);

  // Construct the Capture object  
  video = new Capture(this, wwidth, hheight);
  video.start();
  prev = createImage(wwidth, hheight, RGB);
  output = createImage(wwidth, hheight, RGB);

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  input.start();
  // create a new Amplitude analyzer
  rms = new Amplitude(this);
  rms.input(input);
  tempSecond = millis();
  passDownTemp = millis();
}

void mousePressed() {
}

void captureEvent(Capture video) {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();
  motion();
  //timeTravel(motion);
  //timeTravelPerSecond(motion);
}

void draw() {
  //translate(-width/2.0, -height/2.0, 0);
  background(0);  
  // analyze input audio to change pixel size
  audioAnalysis();

  //motion();
  //if (playMode != 0) {
  //  if (manyFrames[frameNom-1] != null) {
  //    lightBulbArray(manyFrames);
  //  }
  //}

  pushMatrix();

  if (playMode == 1) { // change pixel size based on music beats
    pushMatrix();
    mode1();
    popMatrix();
  }

  //if (playMode == 2) { // single frame single color motion light bulb
  //  pushMatrix();
  //  //mode2();
  //  popMatrix();
  //}

  //if (playMode == 3) { // 
  //  pushMatrix();
  //  frameNom = 20;
  //  strokeC = color(255);
  //  lightBulbArray(manyFrames);
  //  popMatrix();
  //}

  //if (playMode == 4) {
  //  // rabow color motion light bulb
  //  strokeC = color(random(255.0), random(255.0), random(255.0));
  //  showRainbowTravel();
  //}
  //lights();

  // debug mode
  if (playMode == 0) {
    scale(0.5);
    pushMatrix();
    // no.1 image from motion
    image(video, 0, 0);
    //no.2 motion
    translate(wwidth, 0);
    image(motion, 0, 0);
    popMatrix();
    pushMatrix();
    // no.3 light bulb from motion
    translate(0, hheight);
    strokeC = 255;
    lightBulbArray(manyFrames);
    // no.4 single frame light bulb
    translate(wwidth, 0);
    //showRainbowTravel();
    //lightBulbEvery(manyFramesPerSecond);
    popMatrix();
  } 

  popMatrix();



  if (keyPressed) {
    if (key == '1') {
      playMode = 1;
    } else if (key == '2') {
      playMode = 2;
    } else if (key == '3') {
      playMode = 3;
    } else if (key == '4') {
      playMode = 4;
    } else if (key == '5') {
      playMode = 5;
    } else if (key == '6') {
      playMode = 6;
    } else {
      playMode = 0;
    }
  }
}