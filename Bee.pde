PImage abejita;
class Bee {
  float x, y, r, xdir;

  Bee(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = .25;

    this.xdir = 1;
  }

  void grow() {
    this.r = this.r + 2;
    Hit = minim.loadFile("hit.wav", 2048);
    Hit.play();
  }

  void shiftDown() {
    this.xdir *= -1;
    this.y += this.r;
  }

  void move() {
    this.x = this.x + this.xdir;
  }

  void show() {
    image(abejita, this.x, this.y);
  }
}