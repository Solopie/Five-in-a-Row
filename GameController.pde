import java.util.List;
import java.util.Arrays;

class GameController {
  // PlayerID -> PlayerObject
  HashMap<Integer, Player> playersDict;
  int curPlayerID;
  Player curPlayer;
  boolean gameFinished = false;
  
  public GameController(Player[] players) {
    // Create player dict
    this.playersDict = new HashMap<Integer, Player>();
    for(int i = 0; i < players.length; i++) {
      playersDict.put(players[i].playerID,players[i]);
    }
    
    // Start with player one
    setCurrentPlayer(1);
  }
  
  public void nextTurn() {
    // Check if current player won (TODO)
    if(checkCurrentPlayerWin()) {
      endGame();
    } else {
      setCurrentPlayer(++curPlayerID);
    }
  }
  
  /*
  TODO
  
  Algorithm to iterate surroundings cells to identify win.
  */
  public boolean checkCurrentPlayerWin() {
    return false;
  }
  
  /*
  TODO
  
  End game sequence
  Indicate who won
  Outline winning line
  Restart game prompt
  */
  public void endGame() {

    finished = true;
  }
  
  public Player getCurrentPlayer() {
    return curPlayer;
  }
  
  public void setCurrentPlayer(int playerID) {
    if(!playersDict.containsKey(playerID)) {
      // playerID doesn't exist
      playerID = 1;
    }
    
     this.curPlayerID = playerID;
     this.curPlayer = playersDict.get(playerID);
  }
}
