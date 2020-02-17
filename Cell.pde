class Cell implements Drawable {
  public static final int SIZE = 50;
  int x,y;
  // player variable should be initialised when clicked
  boolean clicked;
  Player player;
  
  public Cell(int x,int y) {
    this.x = x;
    this.y = y;
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
    
  
  
  
}