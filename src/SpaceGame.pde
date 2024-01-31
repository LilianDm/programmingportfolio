// Lilian Dmitrieva | November 20, 2023 | Space Game
import processing.sound.*;
SoundFile laser, space, dead;
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowUp> powups = new ArrayList<PowUp>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
Timer starTimer;
int sTime;
int rTime;
int level, score;
boolean play;
int rocksPassed;
PImage startScreen, gameOver;

void setup() {
  size(500, 500);
  laser = new SoundFile(this, "laser2.wav");
  space = new SoundFile(this, "spaceSong.mp3");
  //dead = new SoundFile(this, "Dead.wav");
  score = 0;
  level = 1;
  rTime = 1000;
  rocksPassed = 0;
  s1 = new SpaceShip(width/2, height/2);
  rockTimer = new Timer(rTime);
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    noCursor();
    background(20);
    if (frameCount % 1000 == 10) {
      level++;
    }

    // Add stars
    stars.add(new Star(int(random(width + 30)), -10));
    for (int i = 0; i <stars.size(); i++) {
      Star s = stars.get(i);
      if (s.reachedBottom()) {
        stars.remove(s);
      } else {
        s.display();
        s.move();
      }
    }
    // Add Power ups
    if (puTimer.isFinished()) {
      powups.add(new PowUp(int(random(width + 30)), -100));
      puTimer.start();
    }

    // Render Power ups
    for (int i = 0; i < powups.size(); i++) {
      PowUp pu = powups.get(i);
      if (s1.intersectPU(pu)) {
        if (pu.type == 'a') {
          s1.ammo+= pu.val;
        } else if (pu.type == 'h') {
          s1.health+= pu.val;
        } else if (pu.type == 't') {
          if (s1.turretCount < 3) {
            s1.turretCount+= pu.val;
          } else {
            s1.ammo+= 100;
          }
        }
        //s1.health += pu.diam;
        //powups.remove(pu);
        powups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    // Add rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width + 30)), -100));
      rockTimer.start();
    }
    // Render rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health -= r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocksPassed ++;
        rocks.remove(r);
        score = score - 100;
      } else {
        r.display();
        r.move();
      }
      r.display();
      r.move();
    }
    // Render lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          lasers.remove(l);
          score += r.diam;
          r.diam -= 20;
          if (r.diam < 10) {
            rocks.remove(r);
          }
        }
      }
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);

    infoPanel();

    if (s1.health<1 || rocksPassed>15) {
      GameOver();
    }
  }
}

void mousePressed() {
  if (s1.fire()) {
    laser.play();
    if (s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.ammo -= 1;
    } else if (s1.turretCount == 2) {
      lasers.add(new Laser(s1.x - 15, s1.y));
      lasers.add(new Laser(s1.x + 15, s1.y));
      s1.ammo -= 2;
    } else if (s1.turretCount == 3) {
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x - 15, s1.y));
      lasers.add(new Laser(s1.x + 15, s1.y));
      s1.ammo -= 3;
    } else if (s1.turretCount > 3) {
      s1.ammo += 100;
      s1.ammo -= 3;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    laser.play();
    if (s1.fire()) {
      if (s1.turretCount == 1) {
        lasers.add(new Laser(s1.x, s1.y));
        s1.ammo -= 1;
      } else if (s1.turretCount == 2) {
        lasers.add(new Laser(s1.x - 15, s1.y));
        lasers.add(new Laser(s1.x + 15, s1.y));
        s1.ammo -= 2;
      } else if (s1.turretCount == 3) {
        lasers.add(new Laser(s1.x, s1.y));
        lasers.add(new Laser(s1.x - 15, s1.y));
        lasers.add(new Laser(s1.x + 15, s1.y));
        s1.ammo -= 3;
      }
    }
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(15);
  text("Score: " + score, 60, 40);
  text("Level: " + level, width - 200, 40);
  text("Ammo: " + s1.ammo, width - 360, 40);
  text("Health: " + s1.health, width - 270, 40);
  text("Rocks Passed: " + rocksPassed, 400, 40);

  println("Frame: " + frameCount);
  println("Rocks: " + rocks.size());
  println("Lasers: " + lasers.size());
  println("Stars: " + stars.size());
}

void startScreen() {
  background(0);
  startScreen = loadImage("startScreen.png");
  imageMode(CENTER);
  startScreen.resize(450, 450);
  image(startScreen, width/2, 220);
  fill(255);
  textAlign(CENTER);
  textSize(22);
  text("By Lilian Dmitrieva", 310, 200);
  textSize(44);
  text("Click mouse to begin...", width/2, 480);
  if (mousePressed || keyPressed) {
    play = true;
    space.play();
  }
}

void GameOver() {
  background(0);
  gameOver = loadImage("gameOver.png");
  imageMode(CENTER);
  gameOver.resize(480, 480);
  image(gameOver, width/2, 250);
  textAlign(CENTER);
  textSize(30);
  text("Score: " + score, 80, 450);
  text("Level: " + level, 400, 450);
  noLoop();
  space.pause();
}

void ticker() {
}
