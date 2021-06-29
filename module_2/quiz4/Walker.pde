public class Walker
{
  // for the position
  public float x;
  public float y;
  public float tx = 0, ty = 10000; 

  // for the size
  public float size;
  public float tSize = 5;

  // for the colors
  public float r;
  public float g;
  public float b;
  public float tr = random(256), tg = random(256), tb = random(256);

  void render()
  {
    randomColor();
    noStroke();
    circle(x, y, circleSizePerlin());
  }

  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
  
    tx += 0.009f; // smaller values makes circles closer to each other and gives
    ty += 0.009f; // a more smooth look and fluid movement to the "line"
  }

  float circleSizePerlin()
  {
    size = map(noise(tSize), 0, 1, 5, 150);
    
    tSize += 0.01f;
    
    return size;
  }

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
}
