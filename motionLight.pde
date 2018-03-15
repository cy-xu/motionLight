import peasy.PeasyCam;
import processing.video.*;
import processing.sound.*;
//import gab.opencv.*;

PeasyCam cam;
Capture video;
AudioIn input;
Amplitude rms;
//OpenCV opencv;

int frameNom = 1;
int videoScale = 20; // Size of each cell in the grid
int audioScale = 1;
int cols, rows, wwidth = 640, hheight = 480; // Number of columns and rows in the system
int playMode = 1;
int tempSecond, bmp = 117, bmpMillis;
float minWeight = videoScale * 0.05;
float maxWeight = videoScale * 0.75;
float threshold = videoScale * 0.5;

PImage prev;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

void setup() {
  size(640, 480);
  //size(full);
  //cam = new PeasyCam(this, 600);

  // show which cameras available
  //String[] cameras = Capture.list();
  //printArray(cameras);

  // Initialize columns and rows  
  cols = int(width / videoScale);
  rows = int(height / videoScale);

  // Construct the Capture object  
  video = new Capture(this, 640, 480);
  video.start();
  prev = createImage(640, 480, RGB);

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  input.start();
  // create a new Amplitude analyzer
  rms = new Amplitude(this);
  rms.input(input);
  tempSecond = millis();
}

void mousePressed() {
}

void captureEvent(Capture video) {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();
  //timeTravel(video);
  //timeTravel(motion());
}

void draw() {
  //translate(-width/2.0, -height/2.0, 0);
  background(0);  

  // analyze input audio to change pixel size
  audioAnalysis();

  //motion();

  if (manyFrames[frameNom-1] != null) {
    lightBulb();
    //image(motion(), 0, 0);
  }

  //tint(255,50);
  //lights();
  //if (manyFrames[0] != null) {
  //  lightBulbs(manyFrames);
  //}

  if (playMode == 0) {
    // no.1 image from motion
    image(video, 0, 0, wwidth / 2.0, hheight / 2.0);

    //no.2 original video
    translate(wwidth / 2.0, 0);
    image(motion(), 0, 0, wwidth / 2.0, hheight / 2.0);

    // no.3 the result i want
    translate(video.width, 0, hheight / 2.0);
    lightBulb();

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
  }

  //lights();

  //  camera(camX(), 0.0, camZ(), // eyeX, eyeY, eyeZ
  //    0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //    0.0, 1.0, 0.0); // upX, upY, upZ

  if (keyPressed) {
    if (key == '1') {
      playMode = 1; // change pixel size randomly based on claps
      bmp = 117; // it never rains in southern california
    }
    if (key == '2') {
      playMode = 2; // change pixel size based on volume
      bmp = 137; // cherry bomb
    }
    if (key == '3') {
      playMode = 3; // change pixel size based on volume
      bmp = 137; // cherry bomb
    }
    if (key == 'd' || key == 'D') {
      playMode = 0; // change pixel size based on volume
    }
  }
}