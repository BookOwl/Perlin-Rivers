// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  background(0);
  size(900, 500);
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
  for (int i = 0; i < 120; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 4), random(0.1, 0.5)));
  }
}

void draw() {
  //background(0);
  // Display the flowfield in "debug" mode
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}


void keyPressed() {
  if (key == ' ') {
    saveFrame("frame-####.png");
  }
}

// Make a new flowfield
void mousePressed() {
  background(0);
  flowfield.init();
}