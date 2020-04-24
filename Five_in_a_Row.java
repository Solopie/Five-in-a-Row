Grid grid;
PlayerOne p1 = new PlayerOne();
PlayerTwo p2 = new PlayerTwo();
Player[] players = {p1,p2};
GameController gc = new GameController(players);
Cell test = new Cell(10,10, new MyPoint(10,10));


void setup() {
  size(500,600);
  grid = Grid.getInstance();
}


void draw() {
  background(255);
  
  grid.drawComponent();
  
}

void mouseClicked() {
  Cell clickedCell = grid.getClickedCell(mouseX, mouseY);
  
  if(clickedCell == null || clickedCell.clicked) {
    // Line clicked/Clicked out of grid/Cell already clicked
    return;
  } else {
    clickedCell.setPlayer(gc.getCurrentPlayer());
    if(gc.checkCurrentPlayerWin(clickedCell)) {
      gc.endGame();
    } else {
      gc.nextTurn();
    }
    
  }
}
