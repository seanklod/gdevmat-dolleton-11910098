Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
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
  
  ocean.render();

  for (Walker w : walkers)
  {
    PVector gravity = new PVector(0, -0.15 * w.mass);
    PVector wind = new PVector(0.1, 0);
  
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
    w.render();
    w.update();
    w.applyForce(gravity);
    w.bounce();
    
    // wind only applies to walker if it's still airborne
    if (!ocean.isCollidingWith(w))
    {
      w.applyForce(wind);
    }
    
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}

void initiateWalkers()
{
  float massCount = 10;
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].position.x = 2 * (Window.windowWidth / 10) * (i - 4.5);
    walkers[i].mass = massCount;
    walkers[i].render();
    
    massCount -= 1;
  }
} 
