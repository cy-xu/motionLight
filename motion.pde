// motion compare current and previous frame to get b/w image
PImage motion = createImage(640, 480, RGB);
int motionThreshold = 33;

PImage motion() {

  video.loadPixels();
  prev.loadPixels();
  motion.loadPixels();

  //loadPixels();
  // Begin loop to walk through every pixel
  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      color prevColor = prev.pixels[loc];
      float r2 = red(prevColor);
      float g2 = green(prevColor);
      float b2 = blue(prevColor);

      float d = distSq(r1, g1, b1, r2, g2, b2); 

      if (d > motionThreshold * motionThreshold) {
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