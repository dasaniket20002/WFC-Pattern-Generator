class Cell {
  boolean collapsed;
  ArrayList<Integer> optionsIndices;
  Cell(ArrayList<Integer> options) {
    this.collapsed = false;
    this.optionsIndices = options;
  }
  Cell(int numOfTiles) {
    this.collapsed = false;
    this.optionsIndices = new ArrayList<Integer>();
    for (int i = 0; i < numOfTiles; i++) optionsIndices.add(i);
  }
  void collapse() {
    this.collapsed = true;
    
    if(this.optionsIndices.size() <= 0) {
      reset();
      return;
    }

    int cellOptionIndex = int(random(this.optionsIndices.size()));
    int randomOptionIndex = this.optionsIndices.get(cellOptionIndex);
    this.optionsIndices.clear();
    this.optionsIndices.add(randomOptionIndex);
  }
}
