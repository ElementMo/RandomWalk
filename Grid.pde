import java.util.Map;

abstract class Grid
{
  HashMap<PVector, Integer> grids = new HashMap<PVector, Integer>();
  PVector pos = new PVector(width/2, height/2);

  int MAXSTEPS = 1;
  int CURRENTSTEPS = 0;
  int STEPDIST = 10;
  int GAPSCALE = 0;
  int BORDERSIZE = 5;
  boolean ISTINT = true;
  int seed = 0;

  abstract void update();
  abstract void drawGrid();

  void init()
  {
    grids.clear();
    pos = new PVector(width/2, height/2);
    MAXSTEPS = stepRecorder;
    if (useSeed) {
      randomSeed(seed);
    }
  }

  void quickUpdate(int num)
  {
    for (int i=0; i<num; i++) {
      update();
    }
    fill(200, 200, 200);
    drawGrid();
    getSeedValue();
  }

  void walkOn(PVector pos)
  {
    if (grids.containsKey(pos)) {
      Integer gridCount = grids.get(pos);
      grids.put(pos, gridCount-=10);
    } else {
      grids.put(pos, 150);
    }
  }

  void getSeedValue() {
    String seed = cp.get(Textfield.class, "Seed_Value").getText();
    try {
      rg.seed = Integer.parseInt(seed);
      hg.seed = Integer.parseInt(seed);
    }
    catch(Exception e) {
    }
  }
}
