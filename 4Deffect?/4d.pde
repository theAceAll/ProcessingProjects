float angleX = 0;
float angleY = 0;
float angleZ = 0;
float t = 0; // "fourth dimension" or basically time lol

void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(0);
  lights();
  
  translate(width / 2, height / 2, 0);
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  // Draw a changing 3D structure
  float offset = map(sin(t), -1, 1, 50, 300);
  for (int i = 0; i < 200; i++) {
    float x = cos(radians(i * 5)) * offset;
    float y = sin(radians(i * 5)) * offset;
    float z = cos(t + radians(i * 10)) * offset;
    pushMatrix();
    translate(x, y, z);
    box(10);
    popMatrix();
  }
  
  // increment of the angle and time
  angleX += radians(1);
  angleY += radians(1);
  angleZ += radians(1);
  t += 0.05;
}
