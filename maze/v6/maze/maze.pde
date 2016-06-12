Tile[][] maze = new Tile[25][25];
Tile pos;
memory testMemory = new memory();

void setup(){
    size(625,625);
    makeBase();
    GenMaze();
    startMaze();
}

  void draw(){
    if (key != 't'){
      displayMaze();
      move();
      testMemory.setStarted(false);
    }
    if (key == 't'){
      if (! testMemory.getStarted()){
        testMemory.makeBoard();
      }
      fill(0);
      //text(testMemory.getLives() > 0, 300, 300);
    // while (testMemory.getLives() > 0 && ! testMemory.getSolved()){
      testMemory.selectTile();
      testMemory.checkForPair();
      if (testMemory.pairs == 8){
        key = 'o';
      }
    //}
    
    
    if (testMemory.getLives() == 0){
      testMemory.loseMinigame();
    }
    
    if (testMemory.getSolved()){
      testMemory.winMinigame();
      
    }
    }
  
  }
  
  void move(){
    if(keyPressed){
      if (key == 'w'){
        moveUp();
        keyPressed = false;
      }
      if (key == 's'){
        moveDown();
        keyPressed = false;
      }
      if (key == 'a'){
        moveLeft();
        keyPressed = false;
      }
      if (key == 'd'){
        moveRight();
        keyPressed = false;
      }
    }
  }
  
  void moveUp(){
    int x = pos.getX();
    int y = pos.getY();
    if(y > 0){
      if(maze[x][y-1].isAPath()){
       pos.removePlayerHere();
       maze[x][y-1].movePlayerHere();
       pos = maze[x][y-1];
      }
    }
  }
  
  void moveDown(){
    int x = pos.getX();
    int y = pos.getY();
    if(y < 24){
      if(maze[x][y+1].isAPath()){
       pos.removePlayerHere();
       maze[x][y+1].movePlayerHere();
       pos = maze[x][y+1];
      }
    }
  }
  
  void moveLeft(){
    int x = pos.getX();
    int y = pos.getY();
    if(x > 0){
      if(maze[x-1][y].isAPath()){
       pos.removePlayerHere();
       maze[x-1][y].movePlayerHere();
       pos = maze[x-1][y];
      }  
    }
  }
  
  void moveRight(){
    int x = pos.getX();
    int y = pos.getY();
    if(x < 24){
      if(maze[x+1][y].isAPath()){
       pos.removePlayerHere();
       maze[x+1][y].movePlayerHere();
       pos = maze[x+1][y];
      }  
    }
  }
      
    
  
  void startMaze(){
    maze[0][0].movePlayerHere();
    pos = maze[0][0];
  }


void GenMaze(){
  Tile start = maze[0][0]; 
  start.makePath();
  ArrayList<Tile> frontier = new ArrayList<Tile>();
  frontier.add(maze[0][1]);
  frontier.add(maze[1][0]);
  while (frontier.size() > 0) {
    int randomtile = (int)(Math.random() * frontier.size());
    Tile newPath = frontier.get(randomtile);
    newPath.makePath();
    if (newPath.getX() < 24) {
      if (isNeighbor(maze[newPath.getX()+1][newPath.getY()])) {
        frontier.add(maze[newPath.getX()+1][newPath.getY()]);
      }
      else {
        frontier.remove(maze[newPath.getX()+1][newPath.getY()]);
      }
    }
    
    if (newPath.getY() < 24) {
      if (isNeighbor(maze[newPath.getX()][newPath.getY()+1])) {
        frontier.add(maze[newPath.getX()][newPath.getY()+1]);
      }
      else {
        frontier.remove(maze[newPath.getX()][newPath.getY()+1]);
      }
    }
    
    if (newPath.getX() > 0) {
      if (isNeighbor(maze[newPath.getX()-1][newPath.getY()])) {
        frontier.add(maze[newPath.getX()-1][newPath.getY()]);
      }  
      else {
        frontier.remove(maze[newPath.getX()-1][newPath.getY()]);
      }
    }
    
    if (newPath.getY() > 0) {
      if (isNeighbor(maze[newPath.getX()][newPath.getY()-1])) {
        frontier.add(maze[newPath.getX()][newPath.getY()-1]);
      }
      else {
        frontier.remove(maze[newPath.getX()][newPath.getY()-1]);
      }
    }
    
    frontier.remove(maze[newPath.getX()][newPath.getY()]);
  }
}

boolean isNeighbor(Tile t) {
  int count = 0;
  if (t.isAPath()) {return false;}
  if (t.getX() < 24 && maze[t.getX()+1][t.getY()].isAPath()) {count++;}

  if (t.getY() < 24 && maze[t.getX()][t.getY()+1].isAPath()) {count++;}

  if (t.getX() > 0 && maze[t.getX()-1][t.getY()].isAPath()) {count++;}

  if (t.getY() > 0 && maze[t.getX()][t.getY()-1].isAPath()) {count++;}
  return count == 1;
}



void makeBase(){
  int r = 0;
  int c = 0;
  for(int x = 0; x < width; x += 25){
     c = 0;
     for(int y = 0; y < height; y += 25){
       maze[r][c] = new Tile(x,y,true);
       c++;
     }
     r++;
  }
}

void displayMaze(){
  for(Tile[] i: maze){
    for(Tile j : i){
       j.displayTile();
    }
  }
}


class Tile{
    private int x,y,xcor,ycor;
    boolean isWall, consDir, isVisable, hasPlayer;
    int wgt;
    
    
    
    Tile(int xcorVal, int ycorVal, boolean type){
        xcor = xcorVal;
        ycor = ycorVal;
        x = xcor/25;
        y = ycor/25;
        isWall = type;
        isVisable = false;
        hasPlayer = false;
    }
    
    
    void movePlayerHere(){
      hasPlayer = true;
      checkVis();
    }
    
    void removePlayerHere(){
      hasPlayer = false;
    }
    
    void setWgt(int val){
      wgt = val;
    }
    
    void makeVis(){
      isVisable = true;
    }
    
    
    
    int getWgt(){
      return wgt;
    }
    
    void setDir(boolean x){
      consDir = x;
    }
    
    
    void makeWall(){
        isWall = true;
    }
    
    void checkVis(){
      if(x < 24){
        maze[x+1][y].makeVis();
        if (x < 23){
          maze[x+2][y].makeVis();
        }
      }
      if(x > 0){
        maze[x-1][y].makeVis();
        if (x > 1){
          maze[x-2][y].makeVis();
        }
      }
      if(y < 24){
        maze[x][y+1].makeVis();
        if (y < 23){
          maze[x][y+2].makeVis();
        }
      }
      if(y > 0){
        maze[x][y-1].makeVis();
        if (y > 1){
          maze[x][y-2].makeVis();
        }
      }
      
      if(y < 24 && x < 24){
        maze[x+1][y+1].makeVis();
        if(y < 23){
          maze[x+1][y+2].makeVis();
        }
        if(x < 23){
          maze[x+2][y+1].makeVis();
        }
      }
      
      if(y > 0 && x < 24){
        maze[x+1][y-1].makeVis();
        if(y > 1){
          maze[x+1][y-2].makeVis();
        }
        if(x < 23){
          maze[x+2][y-1].makeVis();
        }
      }
      
      if(y > 0 && x > 0){
        maze[x-1][y-1].makeVis();
        if(y > 1){
          maze[x-1][y-2].makeVis();
        }
        if(x > 1){
          maze[x-2][y-1].makeVis();
        }
      }
      
      if(y < 24 && x > 0){
        maze[x-1][y+1].makeVis();
        if(y < 23){
          maze[x-1][y+2].makeVis();
        }
        if(x < 1){
          maze[x-2][y+1].makeVis();
        }
      }
      
      //bottom left three missing
      
    }
    
    void makePath(){
         isWall = false;
    }
    
    int getX(){
      return x;
    }
    
    int getY(){
      return y;
    }
    
    boolean isAWall(){
      return isWall;
    }
    
    boolean isAPath(){
      return !(isWall);
    }
    
    void displayTile(){
      if(hasPlayer){
        fill(178,102,255);
        rect((float)xcor, (float)ycor, 25.0,25.0);
      }
      else if (isVisable){
       if(isWall){
         fill(0);
         rect((float)xcor, (float)ycor, 25.0,25.0);
        }
        else{
         fill(255);
         rect((float)xcor, (float)ycor, 25.0,25.0);
        }
      }
      else{
        fill(125,125,125);
        rect((float)xcor, (float)ycor, 25.0,25.0);
      }
    }
}