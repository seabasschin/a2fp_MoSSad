






//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^Actual stuffs^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
public abstract class minigame{
  
  //Inst vars
  protected int lives;
  protected boolean solved;
  
  //Methods
  
  public void die(){
    lives--;
  }
  
  public void gainLife(){
    lives++;
  }
  
  public void setLives(int i){
    lives = i;
  }
  
  public int getLives(){
    return lives;
  }
  
  public void setSolved(boolean b){
    solved = b;
  }
  
  public boolean getSolved(){
    return solved;
  }
  
  public void winMinigame(){}
  
  public void loseMinigame(){}
}

//~~~~~~~~~~~~~~~~~~~~MINIGAME MEMORY~~~~~~~~~~~~~~~~~~~~~~~~~~~~
public class memory extends minigame{
  
  //Inst vars
  private int dimension;
  private memoryTile[][] grid; 
  public memoryTile tileUp1;
  public memoryTile tileUp2;
  private boolean started;
  public int pairs;
  
  
  // Methods
  public memory(){
    int dimension = 4;
    grid = new memoryTile[dimension][dimension];
    tileUp1 = null;
    tileUp2 = null;
    started = false;
    lives = 5;
    solved = false;
    pairs = 0;
  }
  
  public void play(){
    if (! getStarted()){
      makeBoard();
      setLives(5);
      setSolved(false);
    }
    while (lives > 0 && !getSolved()){
      checkForPair();
    }
    if (lives == 0){
      loseMinigame();
    }
    if (getSolved()){
      winMinigame();
    }
  }
  
  public void selectTile(){
    boolean isSelected = mousePressed;
    if (isSelected){
    for (memoryTile[] i: grid){
     for (memoryTile j: i){
       if (mouseX > j.getX() && mouseY > j.getY()){
         if( mouseX - j.getX() < 150 && mouseY - j.getY() < 150){
          if (tileUp1 == null){ 
            j.flipTile();
            tileUp1 = j;
          }
          else if (tileUp2 == null && j != tileUp1){
            j.flipTile();
            tileUp2 = j;
         }
        }
       }
     }
    }
    }
  }
  
  public void checkForPair(){
   if (tileUp2 != null && tileUp1 != null){
     if (tileUp1.getColorRow() == tileUp2.getColorRow() && tileUp2.getColorRow() != 8){
        fill(0);
        text("Pair found!", tileUp1.getX() + 10, tileUp1.getY() + 100);
        fill(0);
        text("Pair found!", tileUp2.getX() + 10, tileUp2.getY() + 100);
        delay(1500);
        // tileUp1.displayColor(8);
        // tileUp2.displayColor(8);
        tileUp1 = null;
        tileUp2 = null;
        pairs++;
      }
     else {
      this.die();
      tileUp1.flipTile();
      tileUp2.flipTile();
      fill(0);
      text("Try again!", tileUp2.getX() + 10, tileUp2.getY() + 10);
      delay(1500);
      
      tileUp1 = null;
      tileUp2 = null;
      }
    }
  }
  
  public void setStarted(boolean b){
    started = b;
  }
  
  public boolean getStarted(){
    return started;
  }
  
  public void makeBoard(){
    this.setStarted(true);
    int ctr = 0;
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid.length; j++){
        grid[i][j] = new memoryTile(j,i, ctr % 8);
        grid[i][j].displayColor();
        ctr++;
      }
    }      
}

public class memoryTile{
  
  // Inst vars
  private int x,y;
  private int colorRow;
  private boolean isFaceUp;
  private final int OGCOLOR = 255; 
  public boolean canBeFlipped; 
  public final int[][] COLOR_LIST = {{0,0,204},{255,102,255},{255,255,51},{102,0,254},
                                      {255,0,0},{55, 255,255},{255,128,0},{51,255,51},{128,128,128}};
  
  // Methods
  public memoryTile(int xcor, int ycor, int colour){
    x = xcor * 150;
    y = ycor * 150;
    isFaceUp = false;
    colorRow = colour;
    canBeFlipped = true;
  }
  
  
  
  public void flipTile(){
   if (isFaceUp && mousePressed && canBeFlipped){
      this.displayColor();
      isFaceUp = false;
    }
    else if (canBeFlipped){
      this.displayColor(colorRow);
      isFaceUp = true;
    }
  }
  
  public void displayColor(){
    fill(OGCOLOR);
    rect((float)this.getX(), (float)this.getY(), 150.0, 150.0);
  }
  
  public void displayColor(int i){
   int[] x = COLOR_LIST[i];
   fill(x[0], x[1], x[2]);
   rect((float)this.getX(), (float)this.getY(), 150.0, 150.0);
   if (i == 8){
     canBeFlipped = false;
   }
  }
  
  public int getColorRow(){
    return colorRow;
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
 

}
}