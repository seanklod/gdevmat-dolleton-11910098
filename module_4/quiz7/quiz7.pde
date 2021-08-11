// global variables
Walker[] walkers = new Walker[100];

// for the mouse
PVector mousePos()
{
  return new PVector(mouseX - Window.windowWidth / 2, 
                    -(mouseY - Window.windowHeight / 2));
}

void setup()
{
  background(80);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  initiateWalkerArray();
}


void draw()
{
  background(80);
  
  for (int i = 0; i < walkers.length; i++) // loop for size of array
  {
     walkers[i].computeDirection(mousePos());
     walkers[i].checkEdges();
     walkers[i].moveToDirection();
  }
  
}


void initiateWalkerArray()
{
  for (int i = 0; i < walkers.length; i++) // loop for size of array
  {
     walkers[i] = new Walker();
  }
}
