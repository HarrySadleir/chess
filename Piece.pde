class Piece {
  PImage img;
  int x, y;

  //0 = white, 1 = black
  int bw;

  Piece() {
  }

  void show() {
    image(img, x*w, y*w, w, w);
  }

  void assignLoc() {
    grid[y][x].p = this; 

    for (int y1 = 0; y1 < 8; y1++) {
      for (int x1 = 0; x1 < 8; x1++) {
        if (grid[y1][x1].p == this) {
          if (y1!=y || x1!=x) {
            grid[y1][x1].empty();
          }
        }
      }
    }
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;

    assignLoc();
  }
}

class Rook extends Piece { 
  Rook(int bw, int x, int y) {
    this.bw = bw;
    if (bw == 0) 
      img = wrook;
    else img = brook;
    this.x=x;
    this.y=y;

    assignLoc();
  }

  boolean isValidMove(x, y) {
    if (this.x == x) {
      for (int i = min(this.y, y)+1; i < max(this.y, y); i++) {
        if(grid[i][x].p != null) {
          return false;
        }
      }
      return true;
    }
    
    //repeat this for y and for all the other fucks now
  }
}

class Knight extends Piece {
  Knight(int bw, int x, int y) {
    this.bw = bw;
    if (bw == 0) 
      img = wknight;
    else img = bknight;
    this.x=x;
    this.y=y;

    assignLoc();
  }
}

class Pawn extends Piece {
  Pawn(int bw, int x, int y) {
    this.bw = bw;
    if (bw == 0) 
      img = wpawn;
    else img = bpawn;
    this.x=x;
    this.y=y;

    assignLoc();
  }
}

class Bishop extends Piece {
  Bishop(int bw, int x, int y) {
    this.bw = bw;
    if (bw == 0) 
      img = wbishop;
    else img = bbishop;
    this.x=x;
    this.y=y;

    assignLoc();
  }
}

class Queen extends Piece {
  Queen(int bw, int x, int y) {
    this.bw = bw;
    if (bw == 0) 
      img = wqueen;
    else img = bqueen;
    this.x=x;
    this.y=y;

    assignLoc();
  }
}

class King extends Piece {
  King(int bw, int x, int y) {
    this.bw = bw;
    if (bw == 0) 
      img = wking;
    else img = bking;
    this.x=x;
    this.y=y;

    assignLoc();
  }
}