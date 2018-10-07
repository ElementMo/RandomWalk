import controlP5.*;
import java.util.*;

ControlP5 cp;

void drawUI()
{
  cp.addButton("START").setPosition(20, 20).setSize(100, 30).setColorBackground(color(80, 200, 150));
  
  List l = Arrays.asList("squares", "hexagons");
  cp.addScrollableList("walk_shape").setSize(150, 90).setPosition(20, 80).setItemHeight(30).setBarHeight(30).addItems(l);

  cp.addSlider("Maximum_Steps").setSize(150, 20).setPosition(20, 200).setRange(1, 50000).setValue(5000).setCaptionLabel("Maximum  Steps");
  cp.getController("Maximum_Steps").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp.addSlider("Step_Rate").setSize(150, 20).setPosition(20, 240).setRange(1, 1000).setCaptionLabel("Step  Rate").setValue(10);
  cp.getController("Step_Rate").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp.addSlider("Step_Size").setSize(50, 20).setPosition(20, 300).setRange(2, 20).setValue(10);
  cp.addSlider("Step_Scale").setSize(50, 20).setPosition(20, 330).setRange(0, 10);
  cp.addToggle("Constrain_Steps").setPosition(20, 400).setSize(20, 20).setValue(true);
  cp.addToggle("Simulate_Terrain").setPosition(20, 440).setSize(20, 20).setValue(true);
  cp.addToggle("Use_Stroke").setPosition(20, 480).setSize(20, 20).setValue(true);
  cp.addToggle("Use_random_seed").setPosition(20, 520).setSize(20, 20);
  cp.addTextfield("Seed_Value").setPosition(120, 520).setSize(50, 20);
}

int switchShape = 0;
void walk_shape(int n) {
  switch(n)
  {
  case 0:
    switchShape = 0;
    break;
  case 1:
    switchShape = 1;
    break;
  }
}

boolean startToggle = true;
void START() {
  rg.init();
  hg.init();
  startToggle = true;
}

int stepRecorder;
void Maximum_Steps(int steps) {
  stepRecorder = steps;
  rg.MAXSTEPS = steps;
  hg.MAXSTEPS = steps;
}

void Step_Size(int size) {
  rg.STEPDIST = size;
  hg.STEPDIST = size;
}

void Step_Scale(int scale) {
  rg.GAPSCALE = scale;
  hg.GAPSCALE = scale;
}

boolean constrained = false;
void Constrain_Steps(boolean constrain) {
  constrained = constrain;
}

int stepRate;
void Step_Rate(int rate) {
  stepRate = rate;
}

void Simulate_Terrain(boolean simul) {
  rg.ISTINT = simul;
  hg.ISTINT = simul;
}

void Use_Stroke(boolean useStroke) {
  if (useStroke) {
    stroke(0);
  } else {
    noStroke();
  }
}

boolean useSeed = false;
void Use_random_seed(boolean seed) {
  useSeed = seed;
}
