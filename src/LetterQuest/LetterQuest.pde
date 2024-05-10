// Lilian Dmitrieva | Mon March 18, 2024 | Letter Quest
import processing.sound.*;
SoundFile song, wrong;
PFont font1;
PImage[] startScreen;
PImage end;
PImage[] gifFrames;
boolean play;
boolean howto = true;
int clickCount = 0;
int currentFrame = 0;
int frameDuration = 500;
int lastFrameTime = 1;
int[] frameDurations;
WordList word;
String guessedLetters = "";
GUI gui;

void setup() {
  size(500, 500);
  gifFrames = new PImage[2];
  frameDurations = new int[2];
  word = new WordList();
  String randomWord = word.randWord();
  gui = new GUI(randomWord);
  for (int i = 0; i < 2; i++) {
    gifFrames[i] = loadImage("frame_" + i + ".gif");
    if (i == 0) {
      frameDurations[i] = 1000;
    } else {
      frameDurations[i] = 1000;
    }
  }
  startScreen = new PImage[2];
  frameDurations = new int[2];
  for (int i = 0; i < 2; i++) {
    startScreen[i] = loadImage("start_" + i + ".png");
    if (i == 0) {
      frameDurations[i] = 1000;
    } else {
      frameDurations[i] = 1000;
    }
  }
  frameRate(24);
  font1 = loadFont("AmericanTypewriter-48.vlw");
  song = new SoundFile(this, "cottagecore-17463.mp3");
  song.loop();
  wrong = new SoundFile(this, "G5B2XUD-wrong.mp3");
}

public void draw() {
  textFont(font1);
  if (!play) {
    startScreen();
  } else if (howto) {
    Instructions();
  } else if(gui.won) {
    win();
  } else {
    background(20);
    image(gifFrames[currentFrame], width/2, height/2);
    imageMode(CENTER);
    gui.display();
  }

  if (millis() - lastFrameTime > frameDurations[currentFrame]) {
    currentFrame++;
    if (currentFrame >= 2) {
      currentFrame = 0;
    }
    lastFrameTime = millis();
  }
}

void mousePressed() {
  clickCount++;

  if (clickCount ==2) {
    howto = false;
  }
}
void keyPressed() {
  gui.keyPressed();
}

void startScreen() {
  background(0);
  image(startScreen[currentFrame], width/2, height/2);
  imageMode(CENTER);
  fill(0);
  textAlign(CENTER);
  textSize(22);
  text("By Lilian Dmitrieva", 380, 300);
  textSize(44);
  text("Click mouse to begin...", width/2, 480);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void Instructions() {
  background(20);
  image(gifFrames[currentFrame], width/2, height/2);
  imageMode(CENTER);
  textSize(25);
  fill(0);
  text("The terrible wizard by the name of", width/2, 120);
  text("'Scriptorus Darkscribe' has put", width/2, 150);
  text("a spell on the people of Syntaxia!", width/2, 180);
  text("It is your mission to guess", width/2, 210);
  text("the word the people are cursed with", width/2, 240);
  text("and save everyone!", width/2, 270);
  text("You only have 7 incorrect guesses.", width/2, 300);
  text("                 __                       ", width/2, 300);
  text("click again to begin", width/2, 480);
  textSize(35);
  text("Good luck, Letter Legend...", width/2, 450);
}

void win() {
  background(20);
  image(gifFrames[currentFrame], width/2, height/2);
  imageMode(CENTER);
  textSize(25);
  fill(0);
  text("Scriptorus Darkscribe has been defeated", width/2, 120);
  text("and all the people of Syntaxia", width/2, 150);
  text("have been saved!", width/2, 180);
  text("Congratulations!!!", width/2, 210);
  text("We all believed in you!", width/2, 240);
  textSize(35);
  text("Good job, Letter Legend...", width/2, 300);
  textSize(40);
  text("Click out of tab", width/2, 450);
  noLoop();
}

void gameOver() {
  wrong.play();
  background(20);
  end = loadImage("end_0.png");
  image(end, width/2, height/2);
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(20);
  fill(255);
  text("You have failed.", width/2, 120);
  text("The people of Syntaxia", width/2, 150);
  text("have perished, and Scriptorus Darkscribe", width/2, 180);
  text("rules the dead wasteland.", width/2, 210);
  text("We believed in you, but you", width/2, 240);
  text("have failed us...", width/2, 270);
  text("Farewell, Struggler", width/2, 300);
  textSize(40);
  text("Click out of tab", width/2, 450);
  song.stop();
  noLoop();
}
