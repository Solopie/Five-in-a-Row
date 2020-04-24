class PlayerTwo extends Player{
  
  public PlayerTwo() {
    playerID = 2;
  }
  
  void drawShape(int x, int y) {
    ellipse(x + Cell.SIZE/2, y + Cell.SIZE/2, Cell.SIZE, Cell.SIZE);
  }
  
}
