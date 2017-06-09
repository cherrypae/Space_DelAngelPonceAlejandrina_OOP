PImage shoot; 
class Drop {
  float x, y, r;
  boolean toDelete;

  Drop(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 8;
    this.toDelete = false;
  }

  void show() {
    image(shoot, this.x+6, this.y-38);
  }

  void evaporate() {
    this.toDelete = true;
  }

  boolean hits(Bee Bee) {
    float d = dist(this.x, this.y, Bee.x, Bee.y);
    if (d < this.r + Bee.r) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean hits(Bee2 Bee2) {
    float d = dist(this.x, this.y, Bee2.x, Bee2.y);
    if (d < this.r + Bee2.r) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean hits(Medusa Medusa) {
    float d = dist(this.x, this.y, Medusa.x, Medusa.y);
    if (d < this.r + Medusa.r) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    this.y = this.y - 4;
  }
}