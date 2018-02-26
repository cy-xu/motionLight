//PImage img = adaptive;

float minWeight = 2;
float maxWeight = 15;
int px, py, n = 30;
float currWeight;
//float spacing = 5;

void lightBulbs() {
  for (int x = 0; x < width / n; x++) {
    for (int y = 0; y < height / n; y++) {
      px = n * x;
      py = n * y;
      color pix = motion.get(px, py);
      currWeight = map(brightness(pix), 255, 0, maxWeight, minWeight);
      strokeWeight(currWeight);
      //stroke(#523939); 
      stroke(pix);
      point(px, py);
    }
  }
}

color pix, neighborColor;
int neighborN = 3;

void lightBulbs2() {
  for (int x = 0; x < width / n; x++) {
    for (int y = 0; y < height / n; y++) {
      px = n * x;
      py = n * y;
      // check neighbor pixels, not so good
      pix = motion.get(px, py)/5 + motion.get(px-1, py)/5 + motion.get(px, py-1)/5 + motion.get(px+1, py)/5 + motion.get(px, py+1)/5;
      //color pix = motion.get(px, py);
      currWeight = map(brightness(pix), 255, 0, maxWeight, minWeight);
      strokeWeight(currWeight);
      //stroke(#523939); 
      stroke(pix);
      point(px, py);

      // draw last frame
      //color pixPrev = motionPrev.get(px, py);
      //currWeight = map(brightness(pixPrev), 255, 0, maxWeight, minWeight);
      //strokeWeight(currWeight);
      ////stroke(#523939); 
      //stroke(pixPrev);
      //point(px, py);
    }
  }
}

void neighborColor(int px, int py) { 
  for (int i = 1; i < neighborN; i++) {
    for (int j = 1; j < neighborN; j++) {
      neighborColor += motion.get(px - i, py - i)/25;
      neighborColor += motion.get(px + i, py + i)/25;
    }
  }
}