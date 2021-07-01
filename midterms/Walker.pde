class Walker
{
  int scale;
  public PVector position;
  public PVector direction;
  
  // for the colors
  public float r;
  public float g;
  public float b;
  public float tr = random(256), tg = random(256), tb = random(256);
  
  // checks if all circles have moved to the blackhole's pos
  boolean isMoved = false;
  
  // for the mouse
  PVector mousePos()
  {
    float x = mouseX - Window.windowWidth / 2;
    float y = -(mouseY - Window.windowHeight / 2);
    return new PVector(x, y);
  }
  
// FUNCTIONS BELOW
// --------------------------------------------------------------------------------------------------------
  
  // creates the circle, position & scale depends on circleType
  void render(String circleType)
  {
    if (circleType == "blackHole") 
    {
      scale = 50; // if rendering black hole, set scale to 50
      fill(255);  // make the blackhole white
      
      circle(blackHolePosRand().x, blackHolePosRand().y, scale); // creates the blackhole
      position = blackHolePosRand();
    }
    
    else 
    {
      scale = int(random(10, 30)); // otherwise, randomize circle scaling
      randomColor();
      circle(otherPosRand().x, otherPosRand().y, scale); // creates the circles
      position = otherPosRand();
    }
  }

  // randomizes black hole position
  PVector blackHolePosRand()
  {
    float x = random(Window.left, Window.right + 1); 
    float y = random(Window.bottom, Window.top + 1);
      
    return new PVector(x, y);
  }
  
  // randomizes other circles using Gaussian
  PVector otherPosRand()
  {
    float xGaussian = randomGaussian();
    float standardDeviation = 250; // how spread out stuff are
    float mean = 0; // determines the center

    float x = standardDeviation * xGaussian + mean;
      
    if (x < Window.left) x = Window.left; // if negative x value becomes smaller than Window.left, clamp its value to Window.left
    else if (x > Window.right) x = Window.right; // same stuff as above^^ but for positive x
      
    float y = random(Window.bottom, Window.top + 1);
      
    return new PVector(x, y);
  }

  // color randomizer using perlin noise
  void randomColor()
  {
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    fill(r, g, b);
    
    tr += 0.010005f;
    tg += 0.010005f;
    tb += 0.010005f;
  }
  
  // compute direction from blackhole to mousePos
  void followMouse()
  {
    PVector mouse = mousePos();
    
    PVector currentDirection = PVector.sub(mouse, this.position);
    this.direction = currentDirection;
    direction.normalize().mult(3); // mult determines movement speed of blackhole
     
    this.position.add(direction);
    moveToDirection();
  }
  
  // computes direction from circle's position to blackhole
  void computeDirection(Walker target)
  {
     PVector currentDirection = PVector.sub(target.position, this.position); // direction = targetVector - thisVector
     this.direction = currentDirection;
     direction.normalize().mult(5); // mult determines movement speed of circles
     
     this.position.add(direction);
     moveToDirection();
          
     computeDistance(target);
   }

  void moveToDirection()
  {
    noStroke();
    
    fill(this.r, this.g, this.b); // use same colors as what was used on initiation
    circle(position.x, position.y, this.scale);
  }
  
  // compute the current distance between blackhole & circle
  void computeDistance(Walker target)
  {
    float currentDistance = this.position.dist(target.position);
    //println("Current Distance = " + currentDistance); // use to test distance
     
    // checks if this walker has moved to the blackHole's position or atleast within its radius
    if (currentDistance <= 10)
    {
      isMoved = true;
    }
  }
}
