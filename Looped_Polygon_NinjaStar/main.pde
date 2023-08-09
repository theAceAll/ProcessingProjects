int sides = 8;          
float radius = 100;       
float offset = 50;       
float rotationSpeed = 0.01; 

void setup(){
  size(800,800);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  float angleStep = TWO_PI/sides;
  float rotation = frameCount*rotationSpeed;

  for (float a = 0; a < TWO_PI; a += angleStep) {
    float x1 = cos(a) * (radius + offset);
    float y1 = sin(a) * (radius + offset);
    float x2 = cos(a + rotation) * radius;
    float y2 = sin(a + rotation) * radius;
    line(x1, y1, x2, y2);
  }
}
