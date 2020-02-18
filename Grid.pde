class Grid implements Drawable {
  int x,y,rows,cols;
  HashMap<Point, Cell> cellDict = new HashMap<>();
  
  Cell[][] cells;
  
  public Grid(int x,int y,int screenHeight, int screenWidth) {
    determineGridSize(screenHeight,screenWidth);
    this.x = x;
    this.y = y;
    this.cells = new Cell[rows][cols];
    initialiseCells();
  }
  
  // Setter for rows and cols
  public void determineGridSize(int sh, int sw) {
    this.rows = sh / Cell.SIZE;
    this.cols = sw / Cell.SIZE;
  }
  
  public void initialiseCells() {
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cells[i][j] = new Cell(i*Cell.SIZE,j*Cell.SIZE);
      }
      
    }
  }
  
  public void drawComponent() {
    for(Cell cell: getCells()) {
      cell.drawComponent();
    }
  }
  
  public ArrayList<Cell> getCells() {
    ArrayList<Cell> tempCells = new ArrayList<Cell>();
    for(int i = 0; i < cells.length; i++) {
      for(int j = 0; j < cells[i].length; j++) {
        tempCells.add(cells[i][j]);
      }
    }
    
    return tempCells;
  }
  
  /*
  Only one cell can be clicked. (Returns cell straight away)

  mX -> mouseX
  mY -> mouseY
  */
  public Cell getClickedCell(int mX, int mY) {
    for(Cell cell: getCells()) {
      if(cell.isClicked(mX,mY)) {
          return cell;
      }
    }
    
    return null;
  }
  
}
