Universe u;
PImage img;
PShape s;

void setup(){
  fullScreen(P3D);
  lights();
  s = loadShape("model.obj");
  u = new Universe(true,s);
}

void draw(){
  background(0);
  noFill();
  u.universeDraw();
  camera(300, 300, 600, 0, 0, 0, 0, 1, 0);
}