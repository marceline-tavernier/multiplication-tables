
// Variables
int numPoints = 200;
int table = 0;
int signedTable = numPoints * 10 + table;
boolean animate = true;

///////////////////////

// Setup
void setup() {
  
  // Set size to 640x640, fps at 30 and title
  size(640, 640);
  frameRate(10);
  surface.setTitle("Multiplication tables");

  // Set the colors to be on the color wheel, stroke weight of 2 and text size of 16
  colorMode(HSB, 360, 255, 255);
  strokeWeight(2);
  textSize(16);
}

// Draw everything
void draw() {
  
  // Black background, move to the middle and draw a circle
  background(0);
  translate(width / 2, height / 2);
  circle(0, 0, width - width / 10);
  
  // Draw the lines
  drawLines();
  
  // If we animate, add 0.1 to the table
  if (animate) {
    table += 1;
  }
  
  // If table is positive, write it
  if (table >= 0) {
    text(table % (numPoints * 10) / 10 + "." + table % 10, 0, height / 2 - 8);
  } 
  
  // Else write it modulo 200
  else {
    signedTable = numPoints * 10 + table;
    text(signedTable % (signedTable * 10) / 10 + "." + signedTable % 10, 0, height / 2 - 8);
  }
}

// Draw the lines
void drawLines() {
  
  // Pick a color based on the table
  if (table >= 0) {
    stroke(table % 360, 255, 255);
  } else {
    stroke((360 + table) % 360, 255, 255);
  }
  
  // Set the radius of the circle
  float radius = (width - width / 10) / 2;
  
  // Draw each line
  for (int i = 0; i < numPoints; i++) {
    
    // Get the angles of the line and draw it
    float angleI = getAngle(i);
    float angleJ = getAngle(i * float(table) / 10);
    line(cos(angleI) * radius, sin(angleI) * radius, cos(angleJ) * radius, sin(angleJ) * radius);
  }
}

// If a key is pressed
void keyReleased() {

  // If it is up, add 1
  if (key == CODED && keyCode == UP) {
    table += 10;
  }

  // If it is down, remove 1
  else if (key == CODED && keyCode == DOWN) {
    table -= 10;
  } 
  
  // If it is left, remove 0.1
  else if (key == CODED && keyCode == LEFT) {
    table -= 1;
  }

  // If it is down, add 0.1
  else if (key == CODED && keyCode == RIGHT) {
    table += 1;
  }
}

// If we click, stop the animation
void mouseReleased() {
  animate = !animate;
}

// Get the angle in radians
float getAngle(float degree) {
  return (TAU / numPoints) * degree;
}
