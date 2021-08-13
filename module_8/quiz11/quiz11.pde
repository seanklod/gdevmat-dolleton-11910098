Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  initiateWalkers();
}

void draw()
{
  background(255);
  
  for (Walker w : walkers)
  {
    w.update();
    w.render();
    
    for (Walker x : walkers)
    {
      if (w != x)
      {
        w.applyForce(x.calculateAttraction(w));
      }
    }
    
  }
}

void initiateWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].render();
  }
} 
