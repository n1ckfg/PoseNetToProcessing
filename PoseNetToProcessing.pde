PImage face;

void setup() {
  size(640, 480, P2D);
  face = loadImage("face03.png");
  face.resize(128, 128);
  imageMode(CENTER);
  
  setupPoseNetReceiver();
}

void draw() {
  background(127);

  stroke(255, 0, 0);
  strokeWeight(2);
  for (int i=0; i<skelPoints.length; i+=2) {
      line(skelPoints[i].position.x, skelPoints[i].position.y, skelPoints[i+1].position.x, skelPoints[i+1].position.y);
  }
  
  stroke(255, 255, 0);
  strokeWeight(20);
  for (int i=0; i<keyPoints.length; i++) {
    point(keyPoints[i].position.x, keyPoints[i].position.y);
    
    if (i == keyPoints.length - 1) {
      image(face, keyPoints[0].position.x, keyPoints[0].position.y);
    }
  }
  

  
  surface.setTitle("" + frameRate);
}
