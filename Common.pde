int BlackFader = -100;

int circleCount;
float hole;
float topMargin;
float bottomMargin;
float sideMargin;
float xPos;


final String presetFilename = "presets.csv";

void keyPressed() {
  if (key == 's') {
    scene.savePreset(0);
  }
  if (key == ' ') {
    showWayHome = !showWayHome;
  }
  if (key == '+') {
    masterPause = !masterPause;
  }
  if (key == '-') {
    try {
      world.clear();
    } 
    catch (Exception e) {
    }
  }
  tempScene = sceneMap.get(Character.toString(key));
  if (tempScene == null) {
    println("No scene found for that character: " + key);
    return;
  }

  OscMessage myMessage = new OscMessage("/2/scene");
  myMessage.add(tempScene.description); /* add description */
  oscP5.send(myMessage, myNetAddressList); 
  println(tempScene.description);
  BlackFader = 50;
}



abstract class Scene {
  String description;
  String id;
  Table table;

  Scene(String id, String description) {
    this.id = id;
    this.description = description;
  }

  String presetId(int presetI) {
    return this.id + "-" + presetI;
  }

  void savePreset(int i) {
    Table table;
    try {
      table = loadTable(presetFilename, "header");
    } 
    catch (NullPointerException e) {
      println("Creating new save file t" + presetFilename);
      table = new Table();
      table.addColumn("id");
      table.addColumn("fader1", Table.INT);
      table.addColumn("fader2", Table.INT);
      table.addColumn("fader3", Table.INT);
      table.addColumn("fader4", Table.INT);
      table.addColumn("fader5", Table.INT);
      table.addColumn("fader6", Table.INT);
    }
    TableRow row = table.findRow(presetId(i), "id");
    if (row == null) {
      row = table.addRow();
      row.setString("id", presetId(i));
    }
    row.setInt("fader1", fader1);
    row.setInt("fader2", fader2);
    row.setInt("fader3", fader3);
    row.setInt("fader4", fader4);
    row.setInt("fader5", fader5);
    row.setInt("fader6", fader6);
    saveTable(table, presetFilename);
  }

  void loadPreset(int i) {
    Table table;
    try {
      table = loadTable(presetFilename, "header");
    } 
    catch (NullPointerException e) {
      println("No presets saved");
      return;
    }
    TableRow row = table.findRow(presetId(i), "id");
    if (row == null) {
      println("No preset for this Scene save");
      return;
    }
    fader1 = row.getInt("fader1");
    fader2 = row.getInt("fader2");
    fader3 = row.getInt("fader3");
    fader4 = row.getInt("fader4");
    fader5 = row.getInt("fader5");
    fader6 = row.getInt("fader6");
    // Notify of changed fader values
  }

  abstract void setup();
  abstract void draw();
}

void changeScene(Scene s) {
  tempScene = s;
  //println("Changescene");
  if (tempScene == null) {
    println("No scene found for that character: " + key);
    return;
  }

  OscMessage myMessage = new OscMessage("/2/scene");
  myMessage.add(tempScene.description); /* add description */
  oscP5.send(myMessage, myNetAddressList); 
  println(tempScene.description);
  BlackFader = 50;
}

