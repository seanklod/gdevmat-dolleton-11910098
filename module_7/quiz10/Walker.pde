public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float scale;
  
  
  public float velocityLimit = 10;
  public float mass = 0;
  
  public int r;
  public int g;
  public int b;
  
  // constructor will initialize values
  public Walker()
  {
    position.y = 300;
    
    r = (int)random(0, 256);
    g = (int)random(0, 256);
    b = (int)random(0, 256);
  }
  
  public void render()
  {
    
    stroke(5);
    scale = this.mass * 15;
    fill(r, g, b);
    circle(this.position.x, this.position.y, scale);
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);    
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void bounce()
  {
    if (this.position.y <= Window.bottom)
    {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
    
    if (this.position.x >= Window.right)
    {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    }
  }
  
}
