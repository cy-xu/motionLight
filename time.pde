PImage[] manyFrames = new PImage[30];

void timeTravel(PImage input) {

  for (int i = manyFrames.length-2; i>=0; i--) {
    if (manyFrames[i]!=null) {
      manyFrames[i+1] = manyFrames[i].copy();
    }
  }
  if (manyFrames[0]==null) {
    manyFrames[0] = new PImage();
  }
  manyFrames[0] = input.copy();
}

void showTimeTravel() {
  for (int i = 0; i < manyFrames.length-1; i++) {
    pushMatrix();
    translate(i * 30, 0, i * -50.0);
    if (manyFrames[i] != null) {
      image(manyFrames[i], 0, 0);
      println("frame" + i + "just showed");
    }
    popMatrix();
  }
}