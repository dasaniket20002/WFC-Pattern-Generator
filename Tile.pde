class Tile {
  PImage image;
  String adjacency[];
  int tileID;
  int tileIndex;

  ArrayList<Integer> connectionIndicesUp,
    connectionIndicesRight,
    connectionIndicesDown,
    connectionIndicesLeft;

  Tile(PImage image, String adjacency[], int tileID) {
    this.image = image;
    this.adjacency = adjacency;
    this.tileID = tileID;
    this.tileIndex = -1;

    connectionIndicesUp = new ArrayList<>();
    connectionIndicesRight = new ArrayList<>();
    connectionIndicesDown = new ArrayList<>();
    connectionIndicesLeft = new ArrayList<>();
  }
  Tile rotate(int rot) {
    PGraphics newImage = createGraphics(image.width, image.height);

    newImage.beginDraw();
    newImage.imageMode(CENTER);
    newImage.translate(image.width / 2, image.height / 2);
    newImage.rotate(HALF_PI * rot);
    newImage.image(this.image, 0, 0);
    newImage.endDraw();

    String newAdjacency[] = new String[this.adjacency.length];
    for (int i = 0; i < this.adjacency.length; i++) {
      newAdjacency[i] = adjacency[(i - rot + adjacency.length) % adjacency.length];
    }

    return new Tile(newImage, newAdjacency, this.tileID);
  }
  void generateConnectionIndices(ArrayList<Tile> tiles) {
    for (Tile t : tiles) {
      if (t.tileID == 5 && this.tileID == 5) continue;
      //UP
      if (isReverse(this.adjacency[0], t.adjacency[2])) {
        connectionIndicesUp.add(t.tileIndex);
      }
      //RIGHT
      if (isReverse(this.adjacency[1], t.adjacency[3])) {
        connectionIndicesRight.add(t.tileIndex);
      }
      //DOWN
      if (isReverse(this.adjacency[2], t.adjacency[0])) {
        connectionIndicesDown.add(t.tileIndex);
      }
      //LEFT
      if (isReverse(this.adjacency[3], t.adjacency[1])) {
        connectionIndicesLeft.add(t.tileIndex);
      }
    }
  }
  boolean isReverse(String s1, String s2) {
    String rev = "";
    for(int i = s2.length() - 1; i >= 0; i--) rev += s2.charAt(i);
    return s1.equals(rev);
  }
}
