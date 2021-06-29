void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  clearScreen();
  
  // creates circles
  createCircle();
  
}

//-----------------------------
void createCircle()
{
  float xGaussian = randomGaussian();
  float standardDeviation = 300; // how spread out stuff are
  float mean = 0; // determines the center

  float x = standardDeviation * xGaussian + mean;
  float y = random(-360, 361);
  
  noStroke();
  randomColor();
  circle(x, y, circleSizeGaussian());
}


//-----------------------------
// flush screen after 300 frames function
void clearScreen()
{
  println(frameCount); // double check frame count
  if (frameCount == 300)
  {
    background(255);
  }
}


//-----------------------------
// randomizes circle scale
float circleSizeGaussian()
{  
  float gaussian = randomGaussian();
  float standardDeviation = 15; // how big circles can get
  float mean = 0; // determines the center
  
  float circleSize = standardDeviation * gaussian + mean;
  
  return circleSize;
}


//-----------------------------
void randomColor()
  {
    // color and opacity variables
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(10, 101));
    
    fill(r, g, b, a);
  }
