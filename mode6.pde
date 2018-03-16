int iFrame = 0;
int nn = 1;
PImage[] manyFramesPerSecond = new PImage[20];

void mode6() {
  frameNom = 10;
  timeTravelPerSecond(motion);
  showRainbowTravel();
}

void showRainbowTravel() {
  int passDownStep = 400;

  if (manyFramesPerSecond[iFrame] != null) {
    float resizeScale = map(iFrame, 0, frameNom - 1, 1, 0.3);
    translate(width / 2.0 * (1 - resizeScale), height / 2.0 * (1 - resizeScale));
    scale(resizeScale);

    strokeC = color(random(255.0), random(255.0), random(255.0));
    stroke(strokeC);

    pixelThisFrame(manyFramesPerSecond[iFrame]);

    println("frame" + iFrame + "just showed");
  }

  if (millis() - passDownTemp > passDownStep) {
    iFrame += nn;

    if (iFrame == frameNom - 1) {
      nn = nn * -1;
    } else if (iFrame == 0 ) {
      nn = nn * -1;
    }

    passDownTemp = millis();
  }
}

///////


void timeTravelPerSecond(PImage input) {
  int updateStep = 200; // every second
  
  if (manyFramesPerSecond[0] == null) {
    manyFramesPerSecond[0] = new PImage();
  }

  if (millis() - passDownTemp2 > updateStep) {
    manyFramesPerSecond[0] = input.copy();

    // copy every frame to next frame in array, backwards
    for (int i = manyFramesPerSecond.length-2; i >= 0; i--) {
      if (manyFramesPerSecond[i] != null) {
        manyFramesPerSecond[i+1] = manyFramesPerSecond[i].copy();
      }
    }
    passDownTemp2 = millis();
  }
}