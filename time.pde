PImage[] manyFrames = new PImage[frameNom];

void timeTravel(PImage input) {
  //if first frame empty, create new and copy from input
  if (manyFrames[0] == null) {
    manyFrames[0] = new PImage();
  }

  // get a new frame
  manyFrames[0] = input.copy();

  // copy every frame to next frame in array, backwards
  for (int i = manyFrames.length-2; i>=0; i--) {
    if (manyFrames[i]!=null) {
      manyFrames[i+1] = manyFrames[i].copy();
    }
  }
}

int i = 0;

void showTimeTravel() {
  int passDownStep = bmpMillis * 5;
  if (millis() - tempSecond > passDownStep) {
    if (i > manyFrames.length - 1) {
      i = 0;
    } else {
      float resizeScale = map(i, 0, frameNom - 1, 1, 0.5);
      pushMatrix();
      scale(resizeScale);
      translate(width / 2.0 * (1 - resizeScale), height / 2.0 * (1 - resizeScale));
      if (manyFrames[i] != null) {
        image(manyFrames[i], 0, 0);
        println("frame" + i + "just showed");
      }
      popMatrix();
      i++;
      passDownStep = millis();
    }
  }
}

//for (int i = 0; i < manyFrames.length; i++) {