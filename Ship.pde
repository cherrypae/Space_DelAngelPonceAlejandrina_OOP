PImage galaga;
class Ship {
  float x,y,r, xdir;

  Ship() {
    this.x = width/2;
    this.y = y;
    this.r = .25;

    this.xdir = 0;
  }

  void show() {
    image(galaga, this.x, 250);
  }

  void setDir(float dir) {
    this.xdir = dir;
  }

  void move() {
    this.x += this.xdir*2;
  }
  
   boolean hits(Bee Bee) {
    float s = dist(this.x, this.y, Bee.x, Bee.y);
    if (s < this.r + Bee.r) {
      return true;
    } else {
      return false;
    }
  }
  
   boolean hits(Bee2 Bee2) {
    float s = dist(this.x, this.y, Bee2.x, Bee2.y);
    if (s < this.r + Bee2.r) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean hits(Medusa Medusa) {
    float s = dist(this.x, this.y, Medusa.x, Medusa.y);
    if (s < this.r + Medusa.r) {
      return true;
    } else {
      return false;
    }
  }
}