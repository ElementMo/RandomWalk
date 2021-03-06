RectGrid rg;
HexGrid hg;
int switchShape = 0;

void setup()
{
  size(1000, 800);
  rectMode(CENTER);
  colorMode(HSB);
  cp=new ControlP5(this);
  rg = new RectGrid();
  hg = new HexGrid();
  drawUI();
}
void draw()
{
  background(51);

  if (startToggle) {
    switch(switchShape) {
    case 0:
      rg.quickUpdate();
      break;
    case 1:
      hg.quickUpdate();
      break;
    }
  }
  fill(0, 0, 100);
  rect(100, height/2, 200, height);
  System.gc();
}
