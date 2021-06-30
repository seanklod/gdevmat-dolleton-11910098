class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(10, 12); // x and y speed
  
  void moveAndBounce()
  {
    position.add(speed);
  
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      randomColor();
      speed.x *= -1;
    }

    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      randomColor();
      speed.y *= -1;
    }
    
    
    circle(position.x, position.y, 70);
  }
  
  void randomColor()
  {
    // color and opacity variables
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    
    fill(r, g, b);
  }
}
