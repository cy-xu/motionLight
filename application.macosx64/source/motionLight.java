import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 
import gab.opencv.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class motionLight extends PApplet {

// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/QLHMtE5XsMs




Capture video;
OpenCV opencv;

PImage prev;
//PImage prev, motion;
float threshold = 25;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

int videoScale = 10;
int cols, rows;

public void setup() {

  

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

public void mousePressed() {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();

  timeTravel(motion());
}

public void captureEvent(Capture video) {
}

public void draw() {
  translate(-width/2.0f, -height/2.0f, height/2);
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
      int c = video.get(i, j);
      currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

      int x = i * videoScale;
      int y = j * videoScale;

      strokeWeight(currWeight);
      stroke(0xff523939); 
      //stroke(pix);
      point(x + videoScale/2, y + videoScale/2);
    }
  }

//  camera(camX(), 0.0, camZ(), // eyeX, eyeY, eyeZ
//    0.0, 0.0, 0.0, // centerX, centerY, centerZ
//    0.0, 1.0, 0.0); // upX, upY, upZ
}

public float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

// scene top and bottom angles
public float camX() {
  float front = 0.0f;
  float side = width * 1.0f;

  if (mouseX <= 0.3f * width) {
    return front;
  } else {
    return map(mouseX, 0.3f * width, width, front, side);
  }
}

public float camZ() {
  float front = width;
  float side = width * 3.0f;

  if (mouseX <= 0.3f * width) {
    return front;
  } else {
    return map(mouseX, 0.3f * width, width, front, side);
  }
}
//PImage img = adaptive;

float minWeight = 1;
float maxWeight = 5;
int px, py, pz, n = 10, zSpace = 50;
float currWeight;
int pix;

public void lightBulbs(PImage[] input) {
  for (int z = 0; z < input.length - 1; z++) {
    for (int x = 0; x < width / n; x++) {
      for (int y = 0; y < height / n; y++) {
        px = n * x;
        py = n * y;
        pz = z * zSpace;

        int pix = input[z].get(px, py);
        currWeight = map(brightness(pix), 255, 0, maxWeight, minWeight);

        //pushMatrix();
        //lights();
        translate(px, py, pz);
        sphere(currWeight);
        //popMatrix();
      }
    }
    println("image z from from array " + manyFrames[z]);
    println("image z from from input " + input[z]);
  }
}

int neighborColor;
int neighborN = 3;

public void lightBulbs2() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; i++) {
      int c = video.get(i, j);
      currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

      int x = i * videoScale;
      int y = j * videoScale;

      strokeWeight(currWeight);
      stroke(0xff523939); 
      //stroke(pix);
      point(x + videoScale/2, y + videoScale/2);
    }
  }
}

// motion compare current and previous frame to get b/w image

public PImage motion() {
  PImage motion = createImage(640, 480, RGB);

  video.loadPixels();
  prev.loadPixels();
  motion.loadPixels();

  //threshold = map(mouseX, 0, width, 0, 100);
  threshold = 30;

  int count = 0;

  float avgX = 0;
  float avgY = 0;

  //loadPixels();
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {

      // Reverse the column to mirro the image.
      int loc = (video.width - x - 1) + y * video.width;       
      //int loc = x + y * video.width;

      // calculate motion by comparing previous and current frame
      int c = video.pixels[loc];
      float r1 = red(c);
      float g1 = green(c);
      float b1 = blue(c);
      int pc = prev.pixels[loc];
      float r2 = red(pc);
      float g2 = green(pc);
      float b2 = blue(pc);
      float d = distSq(r1, g1, b1, r2, g2, b2);

      //motion.pixels[loc] = color(map(d, 0, 10000, 0, 255));

      if (d > threshold*threshold) {
        //stroke(255);
        //strokeWeight(1);
        //point(x, y);
        motion.pixels[loc] = color(255);
      } else {
        motion.pixels[loc] = color(0);
      }
    }
  }
  motion.updatePixels();
  return motion;
}

//image(motion, 0, 0);

// We only consider the color found if its color distance is less than 10. 
// This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
//if (count > 200) { 
//  motionX = avgX / count;
//  motionY = avgY / count;
//  // Draw a circle at the tracked pixel
//}

//lerpX = lerp(lerpX, motionX, 0.1); 
//lerpY = lerp(lerpY, motionY, 0.1); 

// draw the pink ball
//fill(255, 0, 255);
//strokeWeight(2.0);
//stroke(0);
//ellipse(lerpX, lerpY, 36, 36);

//image(video, 0, 0, 100, 100);
//image(prev, 100, 0, 100, 100);

//println(mouseX, threshold);

PImage[] manyFrames = new PImage[30];

public void timeTravel(PImage input) {
  //if first frame empty, create new and copy from input
  if (manyFrames[0] == null) {
    manyFrames[0] = new PImage();
  }
  manyFrames[0] = input.copy();

  // copy every frame to next frame in array, backwards
  for (int i = manyFrames.length-2; i>=0; i--) {
    if (manyFrames[i]!=null) {
      manyFrames[i+1] = manyFrames[i].copy();
    }
  }
}

public void showTimeTravel() {
  for (int i = 0; i < manyFrames.length-1; i++) {
    pushMatrix();
    translate(i * 30, 0, i * -50.0f);
    if (manyFrames[i] != null) {
      image(manyFrames[i], 0, 0);
      println("frame" + i + "just showed");
    }
    popMatrix();
  }
}

  public void settings() {  size(640, 480, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "motionLight" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
