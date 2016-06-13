Tile[][] maze = new Tile[25][25];

void setup(){
    size(625,625);
    makeBase();
    //maze[5][5].makePath();
    GenMaze();
  
}




void GenMaze(){//creates randomly generated maze
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


   void draw(){
  display();
}

void makeBase(){
  int r = 0;
  int c = 0;
  for(int x = 0; x < width; x += 25){
     c = 0;
     for(int y = 0; y < height; y += 25){
       maze[r][c] = new Tile(x,y,true);
       c++;
       //stroke(255);
       //fill(255);
       //rect(x,y,25,25);
     }
     r++;
  }
}

void display(){
  for(Tile[] i: maze){
    for(Tile j : i){
       j.displayTile();
    }
  }
}


class Tile{
    private int x,y;
    boolean isWall, consDir, viewable;
    int wgt;
    
    
    Tile(int xcor, int ycor, boolean type){
        x = xcor;
        y = ycor;
        isWall = type;
        viewable = false;
    }
    void setDir(boolean x){
      consDir = x;
    }
    
    void makeWall(){
        isWall = true;
    }
    
    void makePath(){
         isWall = false;
    }
    
    int getX(){
      return x/25;
    }
    
    int getY(){
      return y/25;
    }
    
    boolean isAWall(){
      return isWall;
    }
    
    boolean isAPath(){
      return !(isWall);
    }
    
    boolean isViewable() {
      return viewable;
    }
    
    void changeVisibility() {
      viewable = !viewable;
    }
    
    void displayTile(){
       if(isWall){
         fill(0);
         rect((float)x, (float)y, 25.0,25.0);
        }
        else{
         fill(255);
         rect((float)x, (float)y, 25.0,25.0);
        }
    }
}