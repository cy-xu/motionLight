////PImage img = adaptive;

//int px, py, pz, n = 10, zSpace = 50;
//color pix;

//void lightBulbs(PImage[] input) {
//  for (int z = 0; z < input.length - 1; z++) {
//    for (int x = 0; x < width / n; x++) {
//      for (int y = 0; y < height / n; y++) {
//        px = n * x;
//        py = n * y;
//        pz = z * zSpace;

//        color pix = input[z].get(px, py);
//        float currWeight = map(brightness(pix), 255, 0, maxWeight, minWeight);

//        //pushMatrix();
//        //lights();
//        translate(px, py, pz);
//        sphere(currWeight);
//        //popMatrix();
//      }
//    }
//    println("image z from from array " + manyFrames[z]);
//    println("image z from from input " + input[z]);
//  }
//}

//color neighborColor;
//int neighborN = 3;

//void lightBulbs2() {
//  for (int i = 0; i < cols; i++) {
//    for (int j = 0; j < rows; i++) {
//      color c = video.get(i, j);
//      currWeight = map(brightness(c), 255, 0, maxWeight, minWeight);

//      int x = i * videoScale;
//      int y = j * videoScale;

//      strokeWeight(currWeight);
//      stroke(#523939); 
//      //stroke(pix);
//      point(x + videoScale/2, y + videoScale/2);
//    }
//  }
//}