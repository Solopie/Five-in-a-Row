class Cell implements Drawable {
  public static final int SIZE = 50;
  int x,y;
  Point coordinate;
  // player variable should be initialised when clicked
  boolean clicked;
  Player player;
  
  public Cell(int x,int y, MyPoint c) {
    this.x = x;
    this.y = y;
    this.coordinate = c;
    this.clicked = false;
  }
  
  public void drawComponent() {
    rect(x,y,SIZE,SIZE);
    if(clicked) {
      player.drawShape(x,y);
    }
  }
  
  public boolean isClicked(int x, int y) {
    if(this.x < x && this.x + SIZE > x && this.y < y && this.y + SIZE > y) {
      return true;      
    }
    return false;
  }
  
  public void setPlayer(Player player) {
    this.player = player;
    // To assure playerID is set when we click we set clicked in this method
    clicked = true;
  }
  
  public Player getPlayer() {
    return player;
  }
  
  /*
  T - Top
  B - Bottom
  M - Middle
  L - Left
  R - Right
  
  TL  T  TR
  L   M  R
  BL  B  BR    
    
  */
  public Cell getTL(){ 
    return Grid.getInstance().cellDict.get(new Point(coordinate.x-1,coordinate.y-1));
  }
    
  
  
  
}
