ArrayList<Cell> getCellsWithLeastEntropy() {
  ArrayList<Cell> toCollapse = new ArrayList<>();
  for (int i = 0; i < DIM; i++)
    for (int j = 0; j < DIM; j++)
      if (!grid[i][j].collapsed) toCollapse.add(grid[i][j]);

  int minLength = Integer.MAX_VALUE;
  for (int i = 0; i < toCollapse.size(); i++) {
    Cell c = toCollapse.get(i);
    if (c.optionsIndices.size() < minLength) {
      minLength = c.optionsIndices.size();
    }
  }

  ArrayList<Cell> leastEntropyCells = new ArrayList<>();
  for (Cell c : toCollapse) {
    if (c.optionsIndices.size() <= minLength) leastEntropyCells.add(c);
  }

  return leastEntropyCells;
}

Cell pickRandomCellAndCollapse(ArrayList<Cell> leastEntropyCells) {
  int cellPickIndex = int(random(leastEntropyCells.size()));
  Cell randomCellToCollapse = leastEntropyCells.get(cellPickIndex);
  randomCellToCollapse.collapse();

  return randomCellToCollapse;
}

ArrayList<Integer> removeInvalidOptions(ArrayList<Integer> remainingOptions, ArrayList<Integer> allValids) {
  for (int i = remainingOptions.size() - 1; i >= 0; i--) {
    if (!allValids.contains(remainingOptions.get(i))) remainingOptions.remove(i);
  }
  return remainingOptions;
}

Cell[][] produceNextGeneration() {
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      if (!grid[i][j].collapsed) {
        ArrayList<Integer> optionIndices = new ArrayList<>();
        for (int num = 0; num < tiles.size(); num++) optionIndices.add(num);

        // Look up
        if (i > 0) {
          Cell up = grid[i - 1][j];
          ArrayList<Integer> validOptions = new ArrayList<>();
          for (int option : up.optionsIndices) {
            ArrayList<Integer> valid = tiles.get(option).connectionIndicesDown;
            validOptions.addAll(valid);
          }
          removeInvalidOptions(optionIndices, validOptions);
        }
        // Look right
        if (j < DIM - 1) {
          Cell right = grid[i][j + 1];
          ArrayList<Integer> validOptions = new ArrayList<>();
          for (int option : right.optionsIndices) {
            ArrayList<Integer> valid = tiles.get(option).connectionIndicesLeft;
            validOptions.addAll(valid);
          }
          removeInvalidOptions(optionIndices, validOptions);
        }
        // Look down
        if (i < DIM - 1) {
          Cell down = grid[i + 1][j];
          ArrayList<Integer> validOptions = new ArrayList<>();
          for (int option : down.optionsIndices) {
            ArrayList<Integer> valid = tiles.get(option).connectionIndicesUp;
            validOptions.addAll(valid);
          }
          removeInvalidOptions(optionIndices, validOptions);
        }
        // Look left
        if (j > 0) {
          Cell left = grid[i][j - 1];
          ArrayList<Integer> validOptions = new ArrayList<>();
          for (int option : left.optionsIndices) {
            ArrayList<Integer> valid = tiles.get(option).connectionIndicesRight;
            validOptions.addAll(valid);
          }
          removeInvalidOptions(optionIndices, validOptions);
        }

        grid[i][j].optionsIndices = optionIndices;
      }
    }
  }
  return grid;
}

boolean runWFC() {
  ArrayList<Cell> cellsWithLeastEntropy = getCellsWithLeastEntropy();
  if (cellsWithLeastEntropy.size() > 0) {
    pickRandomCellAndCollapse(cellsWithLeastEntropy);
    produceNextGeneration();
  } else return false;
  return true;
}

void generateGridPattern() {
  boolean areCellsLeftToCollapse = true;
  while (areCellsLeftToCollapse)
    areCellsLeftToCollapse = runWFC();
}
