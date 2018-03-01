//PImage img = adaptive;

float minWeight = 1;
float maxWeight = 5;
int px, py, pz, n = 10, zSpace = 50;
float currWeight;
color pix;

void lightBulbs(PImage[] input) {
  for (int z = 0; z < input.length - 1; z++) {
    for (int x = 0; x < width / n; x++) {
      for (int y = 0; y < height / n; y++) {
        px = n * x;
        py = n * y;
        pz = z * zSpace;
        println(manyFrames[0]);
        println(input[z]);
        color pix = input[z].get(px, py);
        currWeight = map(brightness(pix), 255, 0, maxWeight, minWeight);
        println("3");
        pushMatrix();
        lights();
        translate(px, py, pz);
        sphere(currWeight);
        popMatrix();
      }
    }
  }
}

color neighborColor;
int neighborN = 3;

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