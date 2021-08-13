Walker[] walkers = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  initiateWalkers();
}

void draw()
{
  background(255);
  
  line(0, Window.top, 0, Window.bottom);
  
  for (Walker w : walkers)
  {
    float mew = 0.01f;
    
    if (w.position.x >= 0) mew = 0.4f;
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    PVector acceleration = new PVector(0.2, 0);
    w.update();
    w.render();
    w.applyForce(acceleration);
  }
}

void initiateWalkers()
{
  float massCount = 8;
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].position.y = 2 * (Window.windowHeight / 8) * (i - 4);
    walkers[i].mass = massCount;
    
    massCount -= 1;
  }
}  
  
void mousePressed()
{
   background(255);
   initiateWalkers();
}
