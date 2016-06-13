class Player{
   String name;
   int lives, gamesPlayed, diff;
  
  Player(String n, int difficulty){
    lives = 3;
    gamesPlayed = 0;
    diff = difficulty;
    name = n;
  }
  
  void loseLife(){
     lives = lives - 1;
  }
  
  boolean isAlive(){
    return lives > 0;
  }
  
  public String toString(){
    return name;
  }
  
  int getLives(){
   return lives;
   }
   
  int getdiff() {
    return diff;
  }
  
  void 
}