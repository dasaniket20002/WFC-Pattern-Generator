int DIM = 21;
int NUM_IMAGES = 12;
int offsetW = 0, offsetH = 0;
int cellDim = 0;

boolean debug = false;
boolean animate = false;

Cell[][] grid;
ArrayList<Tile> tiles;

void setup() {
  tiles = loadImages();
  for (Tile t : tiles) {
    t.generateConnectionIndices(tiles);
  }

  int validDim = width < height ? width : height;
  cellDim = validDim / DIM;

  reset();

  offsetW = (width - cellDim * DIM) / 2;
  offsetH = (height - cellDim * DIM) / 2;

  size(1280, 960);

  if (!debug && !animate) generateGridPattern();
}
void mouseClicked() {
  reset();
  if (!debug && !animate) generateGridPattern();
}
void draw() {
  background(20);

  if (debug) {
    textSize(20);
    int xct = 0, yct = 0;
    for (int i = 0; i < tiles.size(); i++) {
      Tile t = tiles.get(i);

      int imgX = 150 * xct;
      int imgY = 130 * yct;

      int txtX = imgX;
      int txtY = imgY + 120;

      xct++;
      if (xct > 6) {
        xct = 0;
        yct++;
      }

      image(t.image, imgX, imgY, 100, 100);
      text(t.tileID, txtX, txtY);
      text(t.tileIndex, txtX + 100 / 2, txtY);

      System.out.println(t.tileIndex + " :\t" + t.adjacency[0] + " " + t.adjacency[1] + " " + t.adjacency[2] + " " + t.adjacency[3]);
    }
    noLoop();
  } else {
    if(animate) runWFC();
    for (int i = 0; i < DIM; i++) {
      for (int j = 0; j < DIM; j++) {
        int drawX = j * cellDim + offsetW;
        int drawY = i * cellDim + offsetH;
        if (!grid[i][j].collapsed) {
          push();
          stroke(255);
          fill(180);
          rect(drawX, drawY, cellDim - 1, cellDim - 1);
          pop();
        } else {
          push();
          image(tiles.get(grid[i][j].optionsIndices.get(0)).image, drawX, drawY, cellDim, cellDim);
          pop();
        }
      }
    }
  }
}
