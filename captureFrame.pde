void pixelThisFrame(PImage frame) {
  stroke(random(255.0), random(255.0), random(255.0));
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {      

      int x = i * videoScale;      
      int y = j * videoScale;    
      //int x = int(i * cols);
      //int y = int(j * rows);

      // Reverse the column to mirro the image.
      //int loc = (frame.width - 10 - x) + j * frame.width; 
      int loc = (frame.width - 1 - x) + y * frame.width; 

      color c = frame.pixels[loc];

      // map weight to a smaller range   // reverse mapping
      float currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);
      //float currWeight = map(brightness(c), 0, 255, maxWeight, minWeight);

      // no.1 paint with points / ellipse
      // use threshold to convert binary lights
      if (currWeight > threshold) {

        strokeWeight(currWeight);
        point(x + 0.5 * videoScale, y + 0.5 * videoScale);
      } else {
        //stroke(c);
        //strokeWeight(minWeight);  
        //point(x + 0.5 * videoScale, y + 0.5 * videoScale);
      }
      //ellipse(x + videoScale/2, y + videoScale/2, currWeight, currWeight);

      // no.2 paint with rect
      //rectMode(CENTER);      
      //fill(255);
      //noStroke();      
      // A rectangle's size is calculated as a function of the pixel’s brightness. 
      // A bright pixel is a large rectangle, and a dark pixel is a small one.
      //float sz = (brightness(c)/255) * videoScale;
      //rect(x + videoScale/2, y + videoScale/2, sz, sz);

      // no.3 paint with sphere (very slow)
      //pushMatrix();
      //noStroke();
      //translate(x + videoScale/2, y + videoScale/2);
      //fill(map(i, 0, cols, 0, 255), map(j, 0, cols, 0, 255), map(i/2+j/2, 0, cols, 0, 255));
      ////sphereDetail(30);
      ////sphere(currWeight);
      //ellipse(0,0,currWeight,currWeight);
      //popMatrix();
    }
  }
}

void lightBulb() {
  for (int i = 0; i < manyFrames.length; i++) {
    //println(manyFrames[i]);
    if ( i % 10 == 0 && manyFrames[i] != null) {
      pushMatrix();
      float resizeScale = map(i, 0, frameNom, 1, 0.1);
      translate(width / 2.0 * (1 - resizeScale), height / 2.0 * (1 - resizeScale));
      scale(resizeScale);
      pixelThisFrame(manyFrames[i]);
      popMatrix();
    }
  }
}