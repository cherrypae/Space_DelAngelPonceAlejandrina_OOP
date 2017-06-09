Ship ship;
Bee[] Bees = new Bee[6];
Bee2[] Bees2 = new Bee2[6];
Medusa[] Medusa = new Medusa[6];
Stars star;
ArrayList<Drop> drops = new ArrayList<Drop>();

import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer Intro;
AudioPlayer Laser;
AudioPlayer Hit;



void setup() {
  size(224, 288);
  galaga = loadImage("galaga.png");
  abejita = loadImage("abejita.png");
  abejita2 = loadImage("abejita2.png");
  medusa = loadImage("medusa.png");
  shoot = loadImage("shoot.png");
  minim = new Minim(this);
  Intro = minim.loadFile("int.mp3", 2048);
  Intro.play();
  ship = new Ship();
  star = new Stars();
  
  for (int i = 0; i < stars; i++) {
    x[i] = int(random(0, 224));
    y[i] = int(random(0, 280));
    starSpeed[i] = int(random(1, 5));
  }

  // drop = new Drop(width/2, height/2);
  for (int i = 0; i < Bees.length; i++) {
    Bees[i] = new Bee(i*80+80, 60);
  }
  for (int i = 0; i < Bees2.length; i++) {
    Bees2[i] = new Bee2(i*80+80, 60);
  }
  for (int i = 0; i < Medusa.length; i++) {
    Medusa[i] = new Medusa(i*80+80, 60);
  }
}

void draw() {
  background(0);
  rectMode(CENTER);
  ship.show();
  ship.move();
  star.draw();

  for (Drop d : drops) {
    d.show();
    d.move();
    for (int j = 0; j < Bees.length; j++) {
      if (d.hits(Bees[j])) {
        Bees[j].grow();
        d.evaporate();
      }
    }
    for (int j = 0; j < Bees2.length; j++) {
      if (d.hits(Bees2[j])) {
        Bees2[j].grow();
        d.evaporate();
      }
    }
    for (int j = 0; j < Medusa.length; j++) {
      if (d.hits(Medusa[j])) {
        Medusa[j].grow();
        d.evaporate();
      }
    }
  }

  boolean edge = false;

  for (int i = 0; i < Bees.length; i++) {
    Bees[i].show();
    Bees[i].move();
    if (Bees[i].x > width || Bees[i].x < 0) {
      edge = true;
    }
  }
  for (int i = 0; i < Bees2.length; i++) {
    Bees2[i].show();
    Bees2[i].move();
    if (Bees2[i].x > width || Bees2[i].x < 0) {
      edge = true;
    }
  }
  for (int i = 0; i < Medusa.length; i++) {
    Medusa[i].show();
    Medusa[i].move();
    if (Medusa[i].x > width || Medusa[i].x < 0) {
      edge = true;
    }
  }

  if (edge) {
    for (int i = 0; i < Bees.length; i++) {
      Bees[i].shiftDown();
    }
  }
  
  if (edge) {
    for (int i = 0; i < Bees2.length; i++) {
      Bees2[i].shiftDown();
    }
  }
  
  if (edge) {
    for (int i = 0; i < Medusa.length; i++) {
      Medusa[i].shiftDown();
    }
  }

  for (int i = drops.size()-1; i >= 0; i--) {
    Drop d = drops.get(i);
    if (d.toDelete) {
      drops.remove(i);
    }
  }
}

void keyReleased() {
  if (key != ' ') {
    ship.setDir(0);
  }
}


void keyPressed() {
  if (key == ' ') {
    Drop drop = new Drop(ship.x, height);
    drops.add(drop);
    Laser = minim.loadFile("laser.wav", 2048);
    Laser.play();
  }

  if (keyCode == RIGHT) {
    ship.setDir(1);
  } else if (keyCode == LEFT) {
    ship.setDir(-1);
  }
}