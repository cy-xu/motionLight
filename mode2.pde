void mode2() {
  pixelThisFrameMode2(motion);
}

void pixelThisFrameMode2(PImage frame) {
  
  float currWeight;
  float localThreshold = 0.7 * videoScale; 

  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {

      int x = i * videoScale;
      int y = j * videoScale;

      // Reverse the column to mirro the image.
      int loc = (frame.width - 1 - x) + y * frame.width; 
      color c = frame.pixels[loc];

      // map weight to a smaller range   // reverse mapping
      currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

      // no.1 paint with points / ellipse
      // use threshold to convert binary lights
      if (currWeight > localThreshold) {
        stroke(255);
        strokeWeight(currWeight);
        point(x + 0.5 * videoScale, y + 0.5 * videoScale);
      } else {
        //strokeWeight(minWeight);
        //stroke(200);;
        //point(x + 0.5 * videoScale, y + 0.5 * videoScale);
      }
    }
  }
}