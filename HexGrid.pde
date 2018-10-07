class HexGrid extends Grid
{
  int spawn_width = (int)(800/(STEPDIST*GAPSCALE)*sqrt(3))*2;
  int spawn_height = (int)(800/(STEPDIST*GAPSCALE));

  HexGrid() {
    pos = new PVector(spawn_width/2, spawn_height/2);
  }

  @Override
    void initGridSize()
  {
    spawn_width = (int)(800/(STEPDIST*GAPSCALE*sqrt(3))*2);
    spawn_height = (int)(800/(STEPDIST*GAPSCALE));
    pos = new PVector(spawn_width/2, spawn_height/2);
  }

  @Override
    void drawGrid() 
  {
    for (Map.Entry grid : grids.entrySet())
    {
      PVector gridPos = (PVector)grid.getKey();
      PVector hexPos = new PVector(0, 0);

      hexPos.x = gridPos.x * STEPDIST * 0.5 * sqrt(3)*GAPSCALE + 205;
      if (gridPos.x % 2 == 0) {
        hexPos.y = gridPos.y * STEPDIST*GAPSCALE + BORDERSIZE;
      } else if (gridPos.x % 2 != 0) {
        hexPos.y = gridPos.y * STEPDIST*GAPSCALE - STEPDIST/2 + BORDERSIZE;
      }
      if (ISTINT) {
        fill((int)grid.getValue(), 200, 200);
      }

      beginShape();
      vertex(hexPos.x + STEPDIST/sqrt(3), hexPos.y);
      vertex(hexPos.x + STEPDIST/sqrt(3)*0.5, hexPos.y + STEPDIST/2);
      vertex(hexPos.x - STEPDIST/sqrt(3)*0.5, hexPos.y + STEPDIST/2);
      vertex(hexPos.x - STEPDIST/sqrt(3), hexPos.y);
      vertex(hexPos.x - STEPDIST/sqrt(3)*0.5, hexPos.y - STEPDIST/2);
      vertex(hexPos.x + STEPDIST/sqrt(3)*0.5, hexPos.y - STEPDIST/2);
      endShape(CLOSE);
    }
  }


  @Override
    void update() 
  {
    if (MAXSTEPS>0) 
    {
      int c = int(random(1, 7));
      PVector tempPos = pos.copy();
      if (pos.x % 2 == 0) {
        switch(c) {
        case 1:
          tempPos.x ++;
          tempPos.y ++;
          break;
        case 2:
          tempPos.y ++;
          break;
        case 3:
          tempPos.x --;
          tempPos.y ++;
          break;
        case 4:
          tempPos.x --;
          break;
        case 5:
          tempPos.y --;
          break;
        case 6:
          tempPos.x ++;
          break;
        }
      } else if (pos.x % 2 != 0) {
        switch(c) {
        case 1:
          tempPos.x ++;
          break;
        case 2:
          tempPos.y ++;
          break;
        case 3:
          tempPos.x --;
          break;
        case 4:
          tempPos.x --;
          tempPos.y --;
          break;
        case 5:
          tempPos.y --;
          break;
        case 6:
          tempPos.x ++;
          tempPos.y --;
          break;
        }
      }
      if (constrained) {
        if (tempPos.x > 0 &&
          tempPos.x < spawn_width &&
          tempPos.y > 0 &&
          tempPos.y < spawn_height) {

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
