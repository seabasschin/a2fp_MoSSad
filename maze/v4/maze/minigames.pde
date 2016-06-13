






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
  
  public void getLives(){
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
  private memoryTile[4][4] grid; 
  
  // Methods
  public void play(){
    makeBoard();
    setLives(3);
    setSolved(false);
    while (lives > 0 && !getSolved()){
      //checkForPair();
    }
    if (lives = 0){
      loseMinigame();
    }
    if (getSolved()){
      winMinigame();
    }
  }
    /*
  public void checkForPair(){
    
  }
   */ 
  public void makeBoard(){
    for (memoryTile[] j: grid){
      for (memoryTile i: j){
        i = new memoryTile(j,i, j*2 + i);
        i.setColor(
        
}

public class memoryTile{
  
  // Inst vars
  private int x,y;
  private int colorRow;
  private boolean isFaceUp;
  private final int OGCOLOR = 255;
  public final int[][] COLOR_LIST = {{0,0,204},{255,102,255},{255,255,51},{102,0,254},
                                      {255,0,0},{55, 255,255},{255,128,0},{255,255,255}};
  
  // Methods
  public memoryTile(int xcor, int ycor, int colour){
    x = xcor * 24;
    y = ycor * 24;
    isFaceUp = false;
    colorRow = colour;
  }
  
  
  
  public void flipTile(){
    if (isFaceUp){
      this.displayColor(OGCOLOR);
    }
    else {
      this.displayColor(colorRow);
    }
  }
  
  pubilc void displayColor(){
    fill(OGCOLOR);
    rect(this.getX(), this.getY(), 24, 24);
  }
  
  pubilc void displayColor(int i){
   int[] x = COLORL_LIST[i];
   fill(x[0], x[1], x[2]);
   rect(this.getX(), this.getY(), 24, 24);
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