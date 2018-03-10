import processing.video.*;
//import gab.opencv.*;

Capture video;
//OpenCV opencv;

// Size of each cell in the grid
int videoScale = 20;
// Number of columns and rows in the system
int cols, rows;
float minWeight = 1;
float maxWeight = 14;

PImage prev;
//PImage prev, motion;
float threshold = 25;
float motionX = 0, motionY = 0;  
float lerpX = 0, lerpY = 0;

void setup() {
  size(640, 480, P3D);

  // show which cameras available
  //String[] cameras = Capture.list();
  //printArray(cameras);

  // Initialize columns and rows  
  cols = width / videoScale;
  rows = height / videoScale;

  // Construct the Capture object  
  video = new Capture(this, cols, rows);
  video.start();

  prev = createImage(640, 480, RGB);
  //motion = createImage(640, 480, RGB);
}

void mousePressed() {
  //prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  //prev.updatePixels();
}

void captureEvent(Capture video) {
  video.read();
  //timeTravel(motion());
}

void draw() {
  //translate(-width/2.0, -height/2.0, height/2);
  background(0);
  //scale(0.5);
  video.loadPixels();  

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

  for (int i = 0; i < cols; i++) {    
    // Begin loop for rows    
    for (int j = 0; j < rows; j++) {      
      // Where are you, pixel-wise?      
      int x = i*videoScale;      
      int y = j*videoScale;    

      // Reverse the column to mirro the image.
      int loc = (video.width - i - 1) + j * video.width;       

      color c = video.pixels[loc];
      // A rectangle's size is calculated as a function of the pixel’s brightness. 
      // A bright pixel is a large rectangle, and a dark pixel is a small one.
      float sz = (brightness(c)/255) * videoScale;       
      // map weight to a smaller range
      float currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

      //rectMode(CENTER);      
      //fill(255);      
      //noStroke();      
      //rect(x + videoScale/2, y + videoScale/2, sz, sz);

      //strokeWeight(currWeight);
      ////stroke(#523939); 
      //stroke(c);
      //point(x + videoScale/2, y + videoScale/2);

      pushMatrix();
      noStroke();
      translate(x + videoScale/2, y + videoScale/2);
      fill(map(i, 0, cols, 0, 255), map(j, 0, cols, 0, 255), map(i/2+j/2, 0, cols, 0, 255));
      sphereDetail(30);
      sphere(currWeight);
      popMatrix();
    }
  }

  //  camera(camX(), 0.0, camZ(), // eyeX, eyeY, eyeZ
  //    0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //    0.0, 1.0, 0.0); // upX, upY, upZ
}