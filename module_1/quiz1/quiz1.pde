// global variables for the sine wave

  float amplitude = 50; // how tall each wave is
  float x = Window.left/2; // sine wave will originate from this point
  float frequency = 10; // how far each wave would be from each other
// -----------


void setup()
{
  background(0);
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

void draw()
{
  drawCartesianPlane();
  
  drawSineWave();
  
  // prints f(x) = x^2 − 15x − 3
  drawQuadraticFunction();
  
  // prints f(x) =−5x +30
  drawLinearFunction();
  
  drawCircle();
  
  
  // press buttons to modify amplitude / frequency
  keyPressed();
  println("Amplitude: " + amplitude);
  println("Frequency: " + frequency);
}

void keyPressed()
  {    
    // Press A to increment amplitude
    if (key == 'a' || key == 'A')
    {
      amplitude += 1;
    }
    
    // Press D to decrement amplitude
    if (key == 'd' || key == 'D')
    {
      amplitude -= 1;
    }
    
    // Press Q to increment frequency
    if (key == 'q' || key == 'Q')
    {
      frequency += 0.05;
    }
    
    // Press E to decrement frequency
    if (key == 'e' || key == 'E')
    {
      frequency -= 0.05;
    }
    
    key = 'p'; // after each press, set this value to a key that's not responsible for
               // changing the values so the amplitude/frequency wont keep changing even if  
               // key has been released
  
  }

void drawCircle()
{
  fill(255);
  stroke(255);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawSineWave()
{  
  // color red
  fill(255, 0, 0);
  noStroke();
 
  // keep spawning circles as long as wave hasnt reached 270 x-axis
  if (x < Window.right/2)
  {     
    circle(x, (float)Math.sin(x/frequency) * amplitude, 2.5);
    x += 0.5f; // this lessens distance between each circle, and slows movement of wave
  }
   
  // sine wave will refresh if it reached the 270 x-axis 
  else if (x >= Window.right/2)
  {
    background(0);
    x = Window.left/2;
  }
} 


void drawCartesianPlane()
{
  strokeWeight(1);
  fill(255);
  stroke(255);
  
  // create cartesian plane main x and y axis
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  // cartesian plane lines loop
  for (int i = -300; i <= 300; i += 10)
  {
     line(i, -3, i, 3);
     line(-3, i, 3, i);   
  }
}

void drawLinearFunction()
{
  fill(128,0,128); // purple linear equation
  noStroke();
  
  // f(x) =−5x +30
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, (-5 * x) + 30, 5);
  } 
}  

void drawQuadraticFunction()
{
  fill(255,255,0); // yellow quadratic function
  stroke(255,255,0);
  noStroke();
  
  // f(x) = x^2 − 15x − 3
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, ((float)Math.pow(x, 2) - (15 * x) - 3), 5);
  }
}
