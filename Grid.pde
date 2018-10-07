import java.util.Map;

abstract class Grid
{
  HashMap<PVector, Integer> grids = new HashMap<PVector, Integer>();
  PVector pos = new PVector(width/2, height/2);

  int MAXSTEPS = 1;
  int CURRENTSTEPS = 0;
  int STEPRATE = 0;
  int STEPDIST = 10;
  float GAPSCALE = 0;
  int BORDERSIZE = 5;
  boolean ISTINT = true;
  boolean ISSTROKE = true;
  boolean constrained = true;
  int seed = 0;

  abstract void update();
  abstract void drawGrid();

  void initGridSize() {
    pos = new PVector(width/2, height/2);
  }
  void init()
  {
    grids.clear();

    switchShape = walk_shape;
    MAXSTEPS = Maximum_Steps;
    STEPDIST = Step_Size;
    GAPSCALE = Step_Scale;
    ISTINT = Simulate_Terrain;
    ISSTROKE = Use_Stroke;
    constrained = Constrain_Steps;

    if (Use_random_seed) {
      randomSeed(seed);
    }
    if (ISSTROKE) {
      stroke(0);
    } else {
      noStroke();
    }

    initGridSize();
  }

  void quickUpdate()
  {
    STEPRATE = Step_Rate;
    for (int i=0; i<STEPRATE; i++) {
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
