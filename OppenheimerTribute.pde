int age=34;
PImage img;
// 7/24/2023
 
void setup(){
  size(1080,1080);
  img=loadImage("oppenheimertribute.jpg");
  img.resize(1080,1080);
  frameRate(120);


}
void draw(){
background(255);

fill(0);
noStroke();
float dots = mouseX/10;
float tileSize = width/dots;
translate(tileSize/2, tileSize/2);

for (int x=0;x<dots;x++){
  for (int y=0;y<dots;y++){
    
    color c = img.get(int(x*tileSize),int(y*tileSize));
    float size = map(brightness(c),0,255,20,0);
    
    ellipse(x*tileSize,y*tileSize, size ,size);
   
}
}
}
