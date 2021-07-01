void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

PVector prevMousePos = new PVector();

void draw()
{
  background(130);
  
  
  drawOneSide();
  drawOtherSide();
}

void drawOneSide()
{
  PVector mouse = mousePos();
  
  float x = mouse.x;
  float y = mouse.y;
  
  // draws black handle
  stroke(0);
  strokeWeight(13);
  mouse.normalize().mult(50);
  line(0, 0, mouse.x, mouse.y);
  
  prevMousePos.x = x;
  prevMousePos.y = y;
  
  // draws red glow
  stroke(255, 0, 0);
  strokeWeight(15);
  mouse.normalize().mult(50);
  line(prevMousePos.x, prevMousePos.y, mouse.x, mouse.y);
  
  // draws white glow
  stroke(255);
  strokeWeight(10);
  mouse.normalize().mult(50);
  line(prevMousePos.x, prevMousePos.y, mouse.x, mouse.y);
  
  println(prevMousePos.mag());
}

void drawOtherSide()
{
  PVector mouse = mousePos();
  
  float x = mouse.x;
  float y = mouse.y;
  
  // draws black handle
  stroke(0);
  strokeWeight(13);
  mouse.normalize().mult(50);
  line(0, 0, -mouse.x, -mouse.y);
  
  prevMousePos.x = x;
  prevMousePos.y = y;
  
  // draws red glow
  stroke(255, 0, 0);
  strokeWeight(15);
  mouse.normalize().mult(50);
  line(-prevMousePos.x, -prevMousePos.y, -mouse.x, -mouse.y);
  
  // draws white glow
  stroke(255);
  strokeWeight(10);
  mouse.normalize().mult(50);
  line(-prevMousePos.x, -prevMousePos.y, -mouse.x, -mouse.y);
}
