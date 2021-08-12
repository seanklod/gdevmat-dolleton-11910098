Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  initiateWalkers();
}


void draw()
{
  background(80);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].render();
    walkers[i].update();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    walkers[i].bounce();
  }
}

void initiateWalkers()
{
  float mass = 0;
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass += mass;
    
    mass += 1;
  }
}
