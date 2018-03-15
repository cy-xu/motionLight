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

int iFrame = 0;
int passDownStep = 100;

void showTimeTravel() {
  
  if (millis() - passDownTemp > passDownStep) {
    if (iFrame > manyFrames.length - 1) {
      iFrame = 0;
    } else {
      float resizeScale = map(iFrame, 0, frameNom - 1, 1, 0.1);
      pushMatrix();
      translate(width / 2.0 * (1 - resizeScale), height / 2.0 * (1 - resizeScale));
      scale(resizeScale);
      if (manyFrames[iFrame] != null) {
        image(manyFrames[iFrame], 0, 0);
        println("frame" + iFrame + "just showed");
      }
      popMatrix();
      iFrame = iFrame + 1;
      passDownTemp = millis();
    }
  }
}

//for (int i = 0; i < manyFrames.length; i++) {