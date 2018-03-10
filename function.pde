//float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
//  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
//  return d;
//}

//// scene top and bottom angles
//float camX() {
//  float front = 0.0;
//  float side = width * 1.0;

//  if (mouseX <= 0.3 * width) {
//    return front;
//  } else {
//    return map(mouseX, 0.3 * width, width, front, side);
//  }
//}

//float camZ() {
//  float front = width;
//  float side = width * 3.0;

//  if (mouseX <= 0.3 * width) {
//    return front;
//  } else {
//    return map(mouseX, 0.3 * width, width, front, side);
//  }
//}