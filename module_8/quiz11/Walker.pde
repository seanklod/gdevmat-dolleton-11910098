public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float scale;
  
  public float gravitationalConst = 1;
  
  public float velocityLimit = 10;
  public float mass = 0;
  
  public int r;
  public int g;
  public int b;
  
  // constructor will initialize values
  public Walker()
  {
    r = (int)random(0, 256);
    g = (int)random(0, 256);
    b = (int)random(0, 256);
    
    mass = random(5, 15);
    position = randomPos();
  }
  
  // RANDOMIZES POSITION
  PVector randomPos()
  {
    return new PVector(random(Window.left, Window.right + 1), 
                       random(Window.bottom, Window.top + 1));
  }
  
  public void render()
  {
    stroke(5);
    scale = this.mass * 10;
    fill(r, g, b, 95);
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
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gravitationalConst * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
