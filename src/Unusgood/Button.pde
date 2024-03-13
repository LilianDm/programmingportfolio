class Button {
  // Button location and size
  float x;
  float y;
  float w;
  float h;
  color c1;
  // Is the button on or off?
  boolean on;
  boolean isNum;
  String val;

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH, color c1, String tempVal) {
    x  = tempX;
    y  = tempY;
    w  = tempW;
    h  = tempH;
    on = false;  // Button always starts as off
    val = tempVal;
    strokeWeight(1);
    this.c1=c1;
  }

  void display() {
    rectMode(CENTER);
    if (on) {
      fill(100);
    } else {
      fill(c1);
    }
    rect(x, y, w, h,10);
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text(val, x, y+5);
  }

  void hover() {
    if (mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2) {
      on = true;
    } else {
      on = false;
    }
  }
}
