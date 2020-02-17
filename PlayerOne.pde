class PlayerOne extends Player{
  
  public PlayerOne() {
    playerID = 1;
  }
  
  void drawShape(int x, int y) {
    line(x, y, x + Cell.SIZE,y + Cell.SIZE);
    line(x + Cell.SIZE, y, x, y + Cell.SIZE);
  }
  
}
