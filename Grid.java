/*
Processing is just putting all my classes into one parent class meaning I have to use static classes for unique and shared fields in a class.
The purpose of static inner classes is so that we can create an inner-class without the outer class. When I try to make a static field in a inner-class, Java
assumes that I won't be able to access the static field because we are in an inner class.

Implement Singleton just because the static cellDict field puts me off since it can be initialised without any of the other fields initialised however, it should be
initialised with all the other fields.

Issue: New objects (Point) can't be created in static class.
*/
static class Grid implements Drawable {
  int x,y,rows,cols;
  HashMap<Point, Cell> cellDict = new HashMap<Point, Cell>();
  Cell[][] cells;
  public static Grid instance = new Grid(0,0,500,500);
  
  private Grid(int x,int y,int screenHeight, int screenWidth) {
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
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        // Coordinate: (col, row) - (x, y)
         Point tempCoordinate = new Point(i,j);
         cells[i][j] = new Cell(i*Cell.SIZE,j*Cell.SIZE, tempCoordinate);
         cellDict.put(tempCoordinate,cells[i][j]);
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
  
  public HashMap<Point,Cell> getCellDict() {
    return cellDict;
  }
  
  public static Grid getInstance() {
    return instance;  
  }
    
  
}
