class Tile {
  float c;
  float x, y;
  Piece p;
  boolean selected;
  Tile(float x, float y, int c) {
    this.x=x;
    this.y=y;
    this.c = c*80+120;
  }

  void show() {
    strokeWeight(0);
    colorMode(HSB);
    fill(c, 255, 255);
    rect(x, y, w, w);
  }

  void empty() {
    p = null;
  }
}