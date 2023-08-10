float speed = 3.0;
int numStars=500;
Star[] stars = new Star[numStars];

void setup() {
  size(800, 600);
  background(0);
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  translate(width / 2, height / 2);
  for (int i = 0; i < numStars; i++) {
    stars[i].update();
    stars[i].show();
  }
}

class Star {
  float x, y, z;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  }
  
  void update() {
    z = z - speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
    }
  }
  
  void show() {
    fill(255);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    float r = map(z, 0, width, 8, 0);
    ellipse(sx, sy, r, r);
  }
}
