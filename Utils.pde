//A - Black || B - Green || C - Light Green || D - Grey

ArrayList<Tile> loadImages() {
  ArrayList<Tile> tiles = new ArrayList<>();
  int index = 0;
  for (int i = 0; i < NUM_IMAGES; i++) {
    PImage image = loadImage("circuit/" + i + ".png");
    Tile tile;
    switch(i) {
    case 0:
      tile = new Tile(image, new String[] {
        "AAA", "AAA", "AAA", "AAA"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 1:
      tile = new Tile(image, new String[] {
        "BBB", "BBB", "BBB", "BBB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 2:
      tile = new Tile(image, new String[] {
        "BBB", "BCB", "BBB", "BBB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 3:
      tile = new Tile(image, new String[] {
        "BBB", "BDB", "BBB", "BDB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 4:
      tile = new Tile(image, new String[] {
        "ABB", "BCB", "BBA", "AAA"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 5:
      tile = new Tile(image, new String[] {
        "ABB", "BBB", "BBB", "BBA"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 6:
      tile = new Tile(image, new String[] {
        "BBB", "BCB", "BBB", "BCB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 7:
      tile = new Tile(image, new String[] {
        "BDB", "BCB", "BDB", "BCB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 8:
      tile = new Tile(image, new String[] {
        "BDB", "BBB", "BCB", "BBB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 9:
      tile = new Tile(image, new String[] {
        "BCB", "BCB", "BBB", "BCB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 10:
      tile = new Tile(image, new String[] {
        "BCB", "BCB", "BCB", "BCB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 11:
      tile = new Tile(image, new String[] {
        "BCB", "BCB", "BBB", "BBB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;

    case 12:
      tile = new Tile(image, new String[] {
        "BBB", "BCB", "BBB", "BCB"
        }, i
        );
      tile.tileIndex = index++;
      tiles.add(tile);
      tile = tile.rotate(1);
      tile.tileIndex = index++;
      tiles.add(tile);
      break;
    }
  }
  return tiles;
}

void reset() {
  grid = new Cell[DIM][DIM];
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      grid[i][j] = new Cell(tiles.size());
    }
  }
}
