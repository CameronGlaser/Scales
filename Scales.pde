int rows, cols;
int mult = 100;
int off = 50;
float wid = 10;
float hgt = 10;
float inc = .3;
boolean tog = true;
float max = 100.0;
float min = 10.0;
float r, g, b, a;

void mouseClicked() {
  changeColor();
}
void changeColor() {
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
}

void setup () {
  rows = height/10;
  cols = width/10;
  size(600, 500);
  //stroke(355, 0, 0);
  //strokeWeight(10);
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  //a = (int)(Math.random()*256);
  a = 255;
}

void draw () {
  background (255);
  breathe();
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      fill(r, b, b, a);
      //System.out.print(x + "," + y + "\t");
      scale(x * mult + off, y * mult + off);
    }
  }
}
void breathe() {
  wid += inc;
  hgt += inc;
  a -= 255/(max-min)*inc;
  if (wid >= max) {

    inc = inc * -1;
  } else if (wid <= min) {
    inc = inc * -1;
    a += 255/(max-min)*inc;
  }
  if (wid <= min)
  {

    r = (int)(Math.random()*256);
    g = (int)(Math.random()*256);
    b = (int)(Math.random()*256);
  }
}

void scale(int x, int y) {
  ellipse(x, y, wid, hgt);
  rect(x - wid/2, y, wid, hgt);
}
