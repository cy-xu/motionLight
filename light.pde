//PImage img = adaptive;

float minWeight = 2;
float maxWeight = 10;
int px, py, n = 20;
float currWeight;
//float spacing = 5;

void lightBulbs() {
  for (int x = 0; x < width / n; x++) {
    for (int y = 0; y < height / n; y++) {
      px = n * x;
      py = n * y;
      color pix = video.get(px, py);
      currWeight = map(brightness(pix), 255, 0, maxWeight, minWeight);
      strokeWeight(currWeight);
      //stroke(#523939); 
      stroke(pix);
      point(px, py);
    }
  }
}


void lightBulbs2() {
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