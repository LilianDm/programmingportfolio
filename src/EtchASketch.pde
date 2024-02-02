int x, y;

void setup() {
  size(400, 400);
  frameRate(10);
  //Set start coords
  x = 10;
  y = 10;
}

void draw() {
  stroke(0);
  strokeWeight(2);
  fill(255);
  //drawName();
  //noLoop();
}

// Algorithm for the first name
void drawName() {
  moveDown(100);
  moveRight(50);
  //moveRightUp(100);
  //moveLeft(10);
  noStroke();
  moveRight(50);
  stroke(2);
  moveUp(100);
  moveRightDown(40);
  moveDown(40);
  moveLeftDown(20);
  moveLeft(20);
}
// Method to draw right line
void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

void moveDown(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

void moveUp(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveLeft(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

void moveRightDown(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

void moveLeftDown(int rep) {
  for (int i = 0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep;
  y=y+rep;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    }
  }


  if (key == 'w' || key == 'W') {
    moveUp(5);
  } else if (key == 'a' || key == 'A') {
    moveLeft(5);
  } else if (key == 's' || key == 'S') {
    moveDown(5);
  } else if (key == 'd' || key == 'D') {
    moveRight(5);
  }
}


void mousePressed() {
  saveFrame("line-######.png");
}
