import controlP5.*;
import java.util.*;

ControlP5 cp;

void drawUI()
{
  cp.addButton("START").setPosition(20, 20).setSize(100, 30).setColorBackground(color(80, 200, 150));

  List l = Arrays.asList("squares", "hexagons");
  cp.addScrollableList("walk_shape").setSize(150, 90).setPosition(20, 80).setItemHeight(30).setBarHeight(30).addItems(l);

  cp.addSlider("Maximum_Steps").setSize(150, 20).setPosition(20, 200).setRange(100, 50000).setValue(5000).setCaptionLabel("Maximum  Steps");
  cp.getController("Maximum_Steps").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp.addSlider("Step_Rate").setSize(150, 20).setPosition(20, 240).setRange(1, 1000).setCaptionLabel("Step  Rate").setValue(10);
  cp.getController("Step_Rate").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp.addSlider("Step_Size").setSize(50, 20).setPosition(20, 300).setRange(10, 30).setValue(10);
  cp.addSlider("Step_Scale").setSize(50, 20).setPosition(20, 330).setRange(1, 1.5);
  cp.addToggle("Constrain_Steps").setPosition(20, 400).setSize(20, 20).setValue(true);
  cp.addToggle("Simulate_Terrain").setPosition(20, 440).setSize(20, 20).setValue(true);
  cp.addToggle("Use_Stroke").setPosition(20, 480).setSize(20, 20).setValue(true);
  cp.addToggle("Use_random_seed").setPosition(20, 520).setSize(20, 20);
  cp.addTextfield("Seed_Value").setPosition(120, 520).setSize(50, 20);
}

int walk_shape = 0;
void walk_shape(int n) {
  switch(n)
  {
  case 0:
    walk_shape = 0;
    break;
  case 1:
    walk_shape = 1;
    break;
  }
}

boolean startToggle = false;
void START() {
  rg.init();
  hg.init();
  startToggle = true;
}

int Maximum_Steps;
void Maximum_Steps(int steps) {
  Maximum_Steps = steps;
}

int Step_Rate;
void Step_Rate(int rate) {
  Step_Rate = rate;
}

int Step_Size;
void Step_Size(int size) {
  Step_Size = size;
}

float Step_Scale;
void Step_Scale(float scale) {
  Step_Scale = scale;
}

boolean Constrain_Steps = true;
void Constrain_Steps(boolean constrain) {
  Constrain_Steps = constrain;
}


boolean Simulate_Terrain;
void Simulate_Terrain(boolean simul) {
  Simulate_Terrain = simul;
}

boolean Use_Stroke;
void Use_Stroke(boolean useStroke) {
  Use_Stroke = useStroke;
}

boolean Use_random_seed = false;
void Use_random_seed(boolean seed) {
  Use_random_seed = seed;
}
