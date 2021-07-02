// global variables
Walker[] walkers = new Walker[100];
Walker blackHole = new Walker();

boolean isDone = false;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // initiates "black" hole
  blackHole.render("blackHole");
  
  initiateWalkerArray();
}

void draw()
{
  background(211); // sets bg to light grey
  
  // this only runs if circles are not within the blackhole yet
  if (!isDone)
  {
    move();
    
    blackHole.followMouse();
    
    // maintains the black hole on screen after each frame refreshes
    fill(255);
    circle(blackHole.position.x, blackHole.position.y, blackHole.scale);
  }
  
  reset();

}

void initiateWalkerArray()
{
  for (int i = 0; i < walkers.length; i++) // loop for size of array
  {
     walkers[i] = new Walker();
     noStroke();
     walkers[i].render("other");
  }
}

void move()
{
  int doneIndexCounter = 0; // used to count if all index are done moving
  
  for (int i = 0; i < walkers.length; i++)
  {
     walkers[i].computeDirection(blackHole);
     walkers[i].moveToDirection();
     walkers[i].computeDistance(blackHole);
     
     if (walkers[i].isMoved == true) // continuously checks if an element has reached blackhole
     {
       doneIndexCounter++; // this increments if an index is at the blackhole
     }
  }
  
  // sets isDone to true if all elements reached blackhole pos, used in reset()
  if (doneIndexCounter == walkers.length)
  {
    isDone = true;
  }
}

void reset()
{
  // call this 'if' only once so that we wont render duplicates of blackhole & circles
  if (isDone == true)
  {
    fill(255);
    blackHole.render("blackHole");
  
    initiateWalkerArray();
    
    isDone = false; // set to false after creating new blackhole & circle array
  }
}
