size(8000, 4500);
noLoop();
background(0);
colorMode(HSB, 360,100,100);


loadPixels();

// Maximum number of iterations for each point on the complex plane
int maxiterations = 600;

for (int x = 0; x < width; x++) {
  for (int y = 0; y < height; y++) {
    float a = map(x, 0, width, -3.2, 2.1);
    float b = map(y, 0, height, -1.5, 1.5);

    float ca = a;
    float cb = b;
    
    int n = 0;
    
    float max = 16;
    
    while (n < maxiterations) {
      float abs = sqrt(a * a + b * b);
      if (abs > max) {
        break;
      }
      float aa = a * a - b * b;
      float bb = 2 * a * b;
      a = aa + ca;
      b = bb + cb;
      n++;
    }

    if (n == maxiterations)
    {
      pixels[x+y*width] = color(0, 0, 0);
    }
    else {
      float norm = map(n, 0, maxiterations, 0, 1);
      //float sat = map(sqrt(norm), 0, 1, 70, 100);
      float bright = map(sqrt(norm), 0, 1, 0, 10);
      pixels[x+y*width] = color(220, 100, 10*bright);
    }
    
  }
}
updatePixels();
save("Mandelbrot.png");
println("Finished");

/*  else {
      float norm = map(n, 0, maxiterations, 0, 1);
      float c = map(sqrt(norm), 0, 1, 0, 255);
      pixels[x+y*width] = color(0.2*c, 0.4*c, 0.9*c);
    }
*/
