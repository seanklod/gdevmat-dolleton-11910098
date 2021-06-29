void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();
Walker myBiasedWalker = new Walker();

void draw()
{
  myWalker.randomWalk();
  noStroke();
  myWalker.render();
  
  myBiasedWalker.randomWalkBiased();
  stroke(0, 0, 0);
  myBiasedWalker.render();
}
