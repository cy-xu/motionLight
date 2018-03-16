void audioAnalysis() {

  // adjust the volume of the audio input
  //input.amp(map(mouseY, 0, height, 0.0, 1.0));
  input.amp(1.0);
  // rms.analyze() return a value between 0 and 1. To adjust
  // the scaling and mapping of an ellipse we scale from 0 to 0.5
  audioScale = int(map(rms.analyze(), 0, 0.20, 20, 60));

  // change beat to meet music
  bmpMillis = int(60 * 1000 / bmp);

  if (playMode == 1) {
    bmp = 117;  // it never rains in southern california
    if (millis() - tempSecond > bmpMillis) {
      //videoScale = int(random(20, 60));
      videoScale = audioScale;
      tempSecond = millis();
    }
  } 

  // clap to change play mode
  if (playMode != 1) {
    if (audioScale > 40) {
      if (playMode == 4) {
        playMode = 2;
      } else {
        playMode += 1;
      }
    }
  }

  cols = int(wwidth / videoScale);
  rows = int(hheight / videoScale);

  minWeight = videoScale * 0.05;
  maxWeight = videoScale * 0.9;
  threshold = videoScale * 0.6;
}