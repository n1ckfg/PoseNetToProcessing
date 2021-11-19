void setup() {
  size(640, 480, P2D);
  setupPoseNetReceiver();
}

void draw() {
  background(127);
  stroke(255, 255, 0);
  strokeWeight(20);
  if (points != null) {
    for (PVector p : points) {
      if (p != null) {
        point(p.x, p.y);
      }
    }
  }
}
