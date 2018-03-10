// motion compare current and previous frame to get b/w image

PImage motion() {
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
      color c = video.pixels[loc];
      float r1 = red(c);
      float g1 = green(c);
      float b1 = blue(c);
      color pc = prev.pixels[loc];
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
