void audioAnalysis() {

  // adjust the volume of the audio input
  //input.amp(map(mouseY, 0, height, 0.0, 1.0));
  input.amp(1.0);
  // rms.analyze() return a value between 0 and 1. To adjust
  // the scaling and mapping of an ellipse we scale from 0 to 0.5
  audioScale = int(map(rms.analyze(), 0, 0.5, 30, 10));

  bmpMillis = int(60 * 1000 / bmp);

  if (millis() - tempSecond > bmpMillis) {
    if (playMode == 1) {
      if (audioScale > 1) {
        videoScale = int(random(20, 60));
      }
    } 
    if (playMode == 2) {
      //videoScale = int(random(20, 60));
      videoScale = audioScale;
    }
    tempSecond = millis();
  }

  cols = int(wwidth / videoScale);
  rows = int(hheight / videoScale);

  minWeight = videoScale * 0.05;
  maxWeight = videoScale * 0.9;
  threshold = videoScale * 0.5;
}