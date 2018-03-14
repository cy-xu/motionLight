void audioAnalysis() {
  // adjust the volume of the audio input
  //input.amp(map(mouseY, 0, height, 0.0, 1.0));
  input.amp(1.0);
  // rms.analyze() return a value between 0 and 1. To adjust
  // the scaling and mapping of an ellipse we scale from 0 to 0.5
  audioScale = int(map(rms.analyze(), 0, 0.5, 1, 20));

  if (audioScale > 5) {
    //videoScale = audioScale;
    videoScale = int(random(10,20));
  }
}