import peasy.PeasyCam;
import processing.video.*;
import processing.sound.*;
//import gab.opencv.*;

PeasyCam cam;
Capture video;
AudioIn input;
Amplitude rms;
//OpenCV opencv;

int videoScale = 20; // Size of each cell in the grid
int audioScale = 1;
int cols, rows, wwidth = 640, hheight = 480; // Number of columns and rows in the system
int frameNom = 1;
float minWeight = videoScale * 0.05;
float maxWeight = videoScale * 0.75;
float threshold = videoScale * 0.5;

PImage prev, motion;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

void setup() {
  size(640, 480, P3D);
  //size(640, 480);
  //cam = new PeasyCam(this, 600);

  // show which cameras available
  //String[] cameras = Capture.list();
  //printArray(cameras);

  // Initialize columns and rows  
  cols = int(width / videoScale);
  rows = int(height / videoScale);

  // Construct the Capture object  
  video = new Capture(this, cols, rows);
  video.start();

  prev = createImage(640, 480, RGB);
  motion = createImage(640, 480, RGB);

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  input.start();
  // create a new Amplitude analyzer
  rms = new Amplitude(this);
  rms.input(input);
}

void mousePressed() {
}

void captureEvent(Capture video) {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();
  timeTravel(video);
  //timeTravel(motion);
  //motion();
}

void draw() {
  //translate(-width/2.0, -height/2.0, 0);
  background(0);
  //scale(0.5);
  video.loadPixels();  

  // analyze input audio to change pixel size
  audioAnalysis();

  if (manyFrames[frameNom-1] != null) {
    lightBulb();
    //image(motion, 0, 0);
  }

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

  //for (int i = 0; i < cols; i++) {
  //  for (int j = 0; j < rows; i++) {

  //    // Reverse the column to mirro the image.
  //    int loc = (cols - i - 1) + j * rows;   

  //    //color c = video.get(i, j);
  //    color c = video.pixels[loc];
  //    float currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

  //    int x = i * videoScale;
  //    int y = j * videoScale;

  //    strokeWeight(currWeight);
  //    stroke(#523939); 
  //    //stroke(pix);
  //    point(x + videoScale/2, y + videoScale/2);
  //  }
  //}

  lights();

  //  camera(camX(), 0.0, camZ(), // eyeX, eyeY, eyeZ
  //    0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //    0.0, 1.0, 0.0); // upX, upY, upZ
}