






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

//~~~~~~~~~~~~~~~~~~~~MINIGAME SUDOKU~~~~~~~~~~~~~~~~~~~~~~~~~~~~

public class sudoku extends minigame {
  
  //Inst vars
  public int[][] beginningGrid = {{0,1,6,9,8,3,0,0,0}, {8,0,2,0,5,0,1,0,4},{0,7,9,0,4,0,0,0,0},{0,9,0,0,6,0,5,0,3},{3,0,0,0,0,9,0,7,2},{1,0,8,0,0,7,4,6,0},{2,0,0,0,0,4,0,0,0},{0,0,0,1,7,0,0,0,6},{0,4,1,0,0,5,0,8,7}};
  public sudokuTile[][] playerGrid = new sudokuTile[9][9];
  public int[][] answerGrid = {{4,1,6,9,8,3,7,2,5},
                               {8,3,2,7,5,6,1,9,4},
                               {5,7,9,2,4,1,6,3,8},
                               {7,9,6,8,6,2,5,1,3},
                               {3,6,2,4,1,9,8,7,2},
                               {1,2,8,5,3,7,4,6,9},
                               {2,8,7,6,9,4,3,5,1},
                               {9,5,3,1,7,8,2,4,6},
                               {6,4,1,3,2,5,9,8,7}};
  public boolean started, played, aTileIsHighlighted;
  public sudokuTile highlightedTile;
  
  //Methods
  public sudoku(){
     started = false;
     played = false;
     lives = 15;
  }
  
  public void makeBoard(){
    int ctr = 0;
    for (int i = 0; i < playerGrid.length; i++){
      for (int j = 0; j < playerGrid.length; j++){
        playerGrid[i][j] = new sudokuTile(i,j, beginningGrid[i][j]);
        playerGrid[i][j].displayGivenTile();
      }
    }  
    this.started = true;
  }


public void selectTile(){
    boolean isSelected = mousePressed;
    if (isSelected){
    for (sudokuTile[] i: playerGrid){
     for (sudokuTile j: i){
       if (mouseX > j.getX() && mouseY > j.getY()){
         if( mouseX - j.getX() < 69 && mouseY - j.getY() < 69){
           if (!aTileIsHighlighted && j.num == 0){
             highlightedTile = j;
             highlightedTile.highlightSquare();          
           }
         }
        }
       }
     }
    }
    }
    
    public void guessNum(char n){
      int i = 0;
      if (n == '1'){
        i = 1;
      }
      if (n == '2'){
        i = 2;
      }
      if (n == '3'){
        i = 3;
      }
      if (n == '4'){
        i = 4;
      }
      if (n == '5'){
        i = 5;
      }
      if (n == '6'){
        i = 6;
      }
      if (n == '7'){
        i = 7;
      }
      if (n == '8'){
        i = 8;
      }
      if (n == '9'){
        i = 9;
      }
      
      if(answerGrid[highlightedTile.getX()/69][highlightedTile.getY()/69] == i){
      highlightedTile.num = i;
      highlightedTile.displayPlayerTile();
      highlightedTile = null;
      aTileIsHighlighted = false;
    }
    else{
      die();
      highlightedTile.displayGivenTile();
      highlightedTile = null;
      aTileIsHighlighted = false;
    }
  }
  
  
}
    
public class sudokuTile{
  
  //Inst vars
  public int num;
  public int x;
  public int y;
  
  //Methods
  public sudokuTile(int xcor, int ycor, int number){
    x = xcor * 69;
    y = ycor * 69;
    num = number;
  }
  
  public void displayPlayerTile(){
    fill(255);
    rect((float)this.getX(), (float)this.getY(), 69, 69);
    textSize(25);
    fill(178,102,255);
    if (num != 0){
      text(num, this.getX() + 30, this.getY() + 30); 
    }
  }
    
  
  public void displayGivenTile(){
    fill(255);
    rect((float)this.getX(), (float)this.getY(), 69, 69);
    textSize(25);
    fill(0);
    if (num != 0){
      text(num, this.getX() + 30, this.getY() + 30); 
    }
  }
  
  
    
    
  
  public void highlightSquare(){
    fill(255,51,153);
    rect((float)this.getX(), (float)this.getY(), 69, 69);
    textSize(10);
    fill(0);
    text("Type the number you think goes here", this.getX() + 5, this.getY() + 5, 69, 69); 
  }
  
  
    
  
  public int getNum(){
    return num;
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  
}
               
    
    
  






//~~~~~~~~~~~~~~~~~~~~MINIGAME MEMORY~~~~~~~~~~~~~~~~~~~~~~~~~~~~
public class memory extends minigame{
  
  //Inst vars
  private memoryTile[][] grid; 
  public memoryTile tileUp1;
  public memoryTile tileUp2;
  public boolean started;
  public int pairs;
  public boolean played;
  
  
  // Methods
  public void wait(int time){
    int ctr = millis();
    int i = 0;
    //fill(0);
    //text("Pair found!", tileUp1.getX() + 10, tileUp1.getY() + 75);
    //fill(0);
    //text("Pair found!", tileUp2.getX() + 10, tileUp2.getY() + 75);
    while(millis() < ctr + time){
      i++;
    }
  }
  
  public memory(){
    grid = new memoryTile[4][4];
    tileUp1 = null;
    tileUp2 = null;
    started = false;
    lives = 5;
    solved = false;
    pairs = 0;
    played = false;
  }
  
  
  
  public void selectTile(){
    boolean isSelected = mousePressed;
    if (isSelected){
    for (memoryTile[] i: grid){
     for (memoryTile j: i){
       if (mouseX > j.getX() && mouseY > j.getY()){
         if( mouseX - j.getX() < 150 && mouseY - j.getY() < 150){
          if (tileUp1 == null && j.getColorRow() != 8){ 
            j.flipTile();
            tileUp1 = j;
            textSize(32);
            fill(0);
            //text("TILE 1!", j.getX() + 50, j.getY() + 50);
          }
          else if (tileUp2 == null && j != tileUp1 && j.getColorRow() != 8){
            j.flipTile();
            tileUp2 = j;
            textSize(32);
            fill(0);
            // text("TILE 2!", j.getX() + 50, j.getY() + 50);
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

       tileUp1.setColorRow(8);
       tileUp2.setColorRow(8);
       tileUp1.displayColor(8);
       tileUp2.displayColor(8);
       // wait(1000);
        tileUp1 = null;
        tileUp2 = null;
        pairs++;
      }
     else {
      this.die();
      wait(1000);
      tileUp1.flipTile();
      tileUp2.flipTile();
      fill(0);
      textSize(20);
      text("Try again!", tileUp2.getX() + 25, tileUp2.getY() + 20);
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
    int ctr = 0;
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid.length; j++){
        grid[i][j] = new memoryTile(j,i, ctr % 8);
        grid[i][j].displayColor();
        ctr++;
        }
      }  
      this.started = true;
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
  
  public void setColorRow(int n){
    colorRow = n;
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }


}