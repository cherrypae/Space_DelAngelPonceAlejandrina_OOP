PImage abejita2;
class Bee2 {
  float x, y, r, xdir;

  Bee2(float x, float y) {
    this.x = x+30;
    this.y = y;
    this.r = .25;

    this.xdir = 1;
  }

  void grow() {
    this.r = this.r + 2;
    Hit = minim.loadFile("hit2.wav", 2048);
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
    image(abejita2, this.x, this.y);
  }
}