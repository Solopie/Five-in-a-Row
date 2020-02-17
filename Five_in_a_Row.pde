Grid grid;
PlayerOne p1 = new PlayerOne();
PlayerTwo p2 = new PlayerTwo();
Player[] players = {p1,p2};
GameController gc = new GameController(players);


void setup() {
  size(500,600);
  grid = new Grid(0,0,500,500);
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
    gc.nextTurn();
  }
}
