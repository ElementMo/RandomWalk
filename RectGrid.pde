class RectGrid extends Grid
{

  RectGrid() {
  }

  @Override
    void drawGrid()
  {
    for (Map.Entry grid : grids.entrySet())
    {
      PVector gridPos = (PVector)grid.getKey();
      if (ISTINT) {
        fill((int)grid.getValue(), 200, 200);
      }
      rect(gridPos.x, gridPos.y, STEPDIST, STEPDIST);
    }
  }

  @Override
    void update()
  {
    if (MAXSTEPS>0) 
    {
      int c = int(random(1, 5));
      PVector tempPos = pos.copy();

      switch(c) {
      case 1:
        tempPos.x += STEPDIST+GAPSCALE;
        break;
      case 2:
        tempPos.x -= STEPDIST+GAPSCALE;
        break;
      case 3:
        tempPos.y += STEPDIST+GAPSCALE;
        break;
      case 4:
        tempPos.y -= STEPDIST+GAPSCALE;
        break;
      }
      if (constrained) {
        if (tempPos.x>200+BORDERSIZE &&
          tempPos.x<width-BORDERSIZE &&
          tempPos.y>BORDERSIZE &&
          tempPos.y<height-BORDERSIZE) {

          pos = tempPos;
          walkOn(pos);
          MAXSTEPS --;
          CURRENTSTEPS ++;
        }
      } else {      
        pos = tempPos;
        walkOn(pos);
        MAXSTEPS --;
        CURRENTSTEPS ++;
      }
    } else
    {
      //println("DONE!");
      //noLoop();
    }
  }
}
