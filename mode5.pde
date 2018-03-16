void mode5() {
  frameNom = 10;
  lightBulbArrayMode5(manyFrames);
}

// show every five frames
void lightBulbArrayMode5(PImage[] input) {
  for (int i = 0; i < input.length; i++) {
    strokeC = color(random(255.0), random(255.0), random(255.0));  
    if (input[i] != null) {
      pushMatrix();
      float resizeScale = map(i, 0, frameNom, 1, 0.1);
      translate(width / 2.0 * (1 - resizeScale), height / 2.0 * (1 - resizeScale));
      scale(resizeScale);
      stroke(strokeC, 255 - (i * 255 / input.length));
      stroke(strokeC); // no alpha change
      pixelThisFrame(input[i]);
      popMatrix();
    }
  }
}