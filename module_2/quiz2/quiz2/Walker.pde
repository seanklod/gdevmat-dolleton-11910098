class Walker
{
  float x;
  float y;
  
  void render()
  {
    randomColor();
    circle(x, y, 30);
  }

  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) y+=10; // forward
    else if (rng == 1) y-=10; // backward
    else if (rng == 2) x+=10; // right
    else if (rng == 3) x-=10; // left
    else if (rng == 4) {x+=10; y+=10;} // upper right
    else if (rng == 5) {x+=10; y-=10;} // lower right
    else if (rng == 6) {x-=10; y+=10;} // upper left
    else if (rng == 7) {x-=10; y-=10;} // lower left
  }
  
  void randomWalkBiased()
  {
    int biasedRng = int(random(100 + 1));
    
    if (biasedRng >= 1 && biasedRng <= 50)  y+=10; // 50% chance forward
    else if (biasedRng >= 51 && biasedRng <= 55) y-=10; // 5% chance backward
    else if (biasedRng >= 56 && biasedRng <= 70) x+=10; // 15% chance right
    else if (biasedRng >= 71 && biasedRng <= 100) x-=10; // 30% chance left
  }
  
  void randomColor()
  {
    // color and opacity variables
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(50, 101));
    
    fill(r, g, b, a);
  }

}
