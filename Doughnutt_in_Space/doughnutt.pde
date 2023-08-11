int numSegments = 100;
int numRings = 100;
float ringRadius = 200;
float tubeRadius = 50;
float[][] torus;
float currentAngle = 0;
int numStars = 200;
PVector[] stars;  

void setup() {
  size(800, 800, P3D);
  torus = new float[numRings][numSegments + 1];
  stars = new PVector[numStars]; 
  for (int i = 0; i < numStars; i++) {
    float x = random(-width / 2, width / 2);
    float y = random(-height / 2, height / 2);
    float z = random(-1000, 1000);
    stars[i] = new PVector(x, y, z);
  }
  noFill();
  stroke(255);
}
void draw() {
  background(0);
  translate(width / 2, height / 2);
  rotateX(PI / 3);
  rotateY(currentAngle);
  for (int i = 0; i < numStars; i++) {
    PVector star = stars[i];
    float starSize = map(star.z, -1000, 1000, 1, 5);
    stroke(255);
    point(star.x, star.y, star.z);
  }
  for (int i = 0; i < numRings; i++) {
    float theta = map(i, 0, numRings, 0, TWO_PI);
    float nextTheta = map(i + 1, 0, numRings, 0, TWO_PI);
    beginShape(QUAD_STRIP);
    for (int j = 0; j <= numSegments; j++) {
      float phi = map(j, 0, numSegments, 0, TWO_PI);
      float x = (ringRadius + tubeRadius * cos(phi)) * cos(theta);
      float y = (ringRadius + tubeRadius * cos(phi)) * sin(theta);
      float z = tubeRadius * sin(phi);
      vertex(x, y, z);
      x = (ringRadius + tubeRadius * cos(phi)) * cos(nextTheta);
      y = (ringRadius + tubeRadius * cos(phi)) * sin(nextTheta);
      z = tubeRadius * sin(phi);
      vertex(x, y, z);
      torus[i][j] = z;
    }
    endShape();
  }
  currentAngle += 0.005;
  if (currentAngle > TWO_PI) {
    noLoop();
  }
}
