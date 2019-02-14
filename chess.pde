Tile[][] grid = new Tile[8][8];
ArrayList<Piece> pieces= new ArrayList<Piece>(32);
int w; 
PImage wpawn, wrook, wknight, wqueen, wking, wbishop, 
  bpawn, brook, bknight, bqueen, bking, bbishop;

void setup() {
  size(600, 600);
  w = width/8;
  wpawn = loadImage("wp.png");
  wbishop = loadImage("wb.png");
  wrook = loadImage("wr.png");
  wknight = loadImage("wk.png");
  wqueen = loadImage("wq.png");
  wking = loadImage("wki.png");
  bpawn = loadImage("bp.png");
  bbishop = loadImage("bb.png");
  brook = loadImage("br.png");
  bknight = loadImage("bk.png");
  bqueen = loadImage("bq.png");
  bking = loadImage("bki.png");

  for (int r = 0; r < 8; r++) {
    for (int c = 0; c < 8; c++) {
      grid[r][c] = new Tile(w*r, w*c, (r+c)%2);
    }
  }

  pieces.add(new Rook(1, 0, 0));
  pieces.add(new Knight(1, 1, 0));
  pieces.add(new Bishop(1, 2, 0));
  pieces.add(new King(1, 3, 0));
  pieces.add(new Queen(1, 4, 0));
  pieces.add(new Bishop(1, 5, 0));
  pieces.add(new Knight(1, 6, 0));
  pieces.add(new Rook(1, 7, 0));
  for (int i = 0; i < 8; i++) {
    pieces.add(new Pawn(1, i, 1));
  }

  pieces.add(new Rook(0, 0, 7));
  pieces.add(new Knight(0, 1, 7));
  pieces.add(new Bishop(0, 2, 7));
  pieces.add(new King(0, 3, 7));
  pieces.add(new Queen(0, 4, 7));
  pieces.add(new Bishop(0, 5, 7));
  pieces.add(new Knight(0, 6, 7));
  pieces.add(new Rook(0, 7, 7));
  for (int i = 0; i < 8; i++) {
    pieces.add(new Pawn(0, i, 6));
  }
}

void draw() {
  for (int r = 0; r < 8; r++) {
    for (int c = 0; c < 8; c++) {
      grid[r][c].show();
    }
  }

  for (Piece p : pieces) {
    p.show();
  }

  //turns
  wturn();
  bturn();
}

void wturn() {

  int i = 0;
  while (i == 0) {
    Piece p = null;
    for(Piece piece : pieces) {
      if(piece.bw==0) {
        grid[piece.y][piece.x].selected = true;
        p = piece;
        break;
      }
    }
    
    if (mousePressed && grid[mouseY/w][mouseX/w].p.bw==0) {
      for (int j = 0; j < 8; j++) {
        for (Tile t : grid[j]) {
          t.selected = false;
        }
      }

      grid[mouseY/w][mouseX/w].selected = true;
      p = grid[mouseY/w][mouseX/w].p;
    }
    
    if(mousePressed && p.isValidMove(mouseY/w, mouseX/w)) {
      p.move(mouseY/w, mouseX/w);
      i = 1;
    }
  }
}

void bturn() {
}

void end() {
}