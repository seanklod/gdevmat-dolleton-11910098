public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public PVector direction = new PVector();
  public int scale;
  
  public float velocityLimit = 10;
  
  // constructor will render it
  public Walker()
  {
    scale = (int)random(15, 30);
    fill(255, 0, 0, 90);
    circle(randomPos().x, randomPos().y, scale);
    position = randomPos();
  }
  
  // RANDOMIZES POSITION
  PVector randomPos()
  {
    return new PVector(random(Window.left, Window.right + 1), 
                       random(Window.bottom, Window.top + 1));
  }
  
  void computeDirection(PVector target)
  {
    PVector curDirection = PVector.sub(target, this.position);
    this.direction = curDirection;
    direction.normalize();
  }
  
  void moveToDirection()
  {
    this.acceleration = direction;
    acceleration.mult(0.2);
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    
    // draw circle as it moves
    fill(255, 0, 0, 90);
    circle(position.x, position.y, this.scale);
  }
  
  // teleports the circle to other side if went outside window bounds
  public void checkEdges()
  {
    // for the x axis
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    // for the y axis
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
