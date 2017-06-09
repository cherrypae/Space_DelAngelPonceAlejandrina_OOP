int stars = 200;
int[] starSpeed = new int [stars];
int[] x = new int [stars];
int[] y = new int [stars];

class Stars{
  void draw(){
     for (int i=0; i < stars; i++) {
    fill(255);
    rect(x[i], y[i], 2, 2);
  }

  for (int i=0;i<stars;i++) {
    y[i]+= starSpeed[i];
    if (y[i] > height) {
      y[i] = 0;
    }
    text("l e f t  o r  r i g h t  t o  m o v e", 30, 30);
    text("s p a c e b a r    t o    s h o o t", 40, 45);
  }
  }
}