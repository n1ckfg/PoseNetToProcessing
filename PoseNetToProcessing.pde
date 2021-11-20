void setup() {
  size(640, 480, P2D);
  setupPoseNetReceiver();
}

void draw() {
  background(127);

  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i=0; i<skelPoints.length; i+=2) {
      line(skelPoints[i].x, skelPoints[i].y, skelPoints[i+1].x, skelPoints[i+1].y);
  }
  
  stroke(255, 255, 0);
  strokeWeight(20);
  for (int i=0; i<keyPoints.length; i++) {
      point(keyPoints[i].x, keyPoints[i].y);
  }
  
  surface.setTitle("" + frameRate);
}
