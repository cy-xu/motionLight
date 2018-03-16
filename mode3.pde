void mode3(){
    frameNom = 20;
    strokeC = color(255);
    lightBulbArray(manyFrames);
}

// show every five frames
void lightBulbArray(PImage[] input) {
  for (int i = 0; i < input.length; i++) {
    //println(manyFrames[i]);
    if ( i % 2 == 0 && input[i] != null) {
      pushMatrix();
      float resizeScale = map(i, 0, frameNom, 1, 0.1);
      translate(width / 2.0 * (1 - resizeScale), height / 2.0 * (1 - resizeScale));
      scale(resizeScale);
      stroke(strokeC, 255 - (i * 255 / input.length));
      pixelThisFrame(input[i]);
      popMatrix();
    }
  }
}