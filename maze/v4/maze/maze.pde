Tile[][] maze = new Tile[24][24];

void setup(){
    size(600,600);
    makeBase();
    //maze[5][5].makePath();
    weightPoints();
    GenMaze();
  
}

void weightPoints(){  
  for(Tile[] i: maze){
    for(Tile j : i){
       j.setWgt((int)(Math.random() * 100));
    }
  }
}


void GenMaze(){
  for(Tile[] i : maze){
    for(Tile j : i){
      Tile curr = j;
      while(curr != null){  
        curr = smallNgr(curr);
      }
    }
  }
}


Tile smallNgr(Tile t){
    int numN = 0;
    int x = t.getX();
    int y = t.getY(); 
    int a = 101;
    int b = 101;
    int c = 101;
    int d = 101;
    
    if(x < 23){
      if(maze[x+1][y].isAWall()){
        a = maze[x+1][y].getWgt();
      }
      else{
        numN++;
      }
    } 
    if(y < 23){
      if(maze[x][y+1].isAWall()){
        b = maze[x][y+1].getWgt();
      }
      else{
        numN++;
      }
    }
    if(x > 0){
      if(maze[x-1][y].isAWall()){
        c = maze[x-1][y].getWgt();
      }
      else{
        numN++;
      }
    }
    if(y > 0){
      if(maze[x][y-1].isAWall()){
        d = maze[x][y-1].getWgt();
      }
      else{
        numN++;
      }
    }
    if(numN != 1 && (x != 0 && y != 0)){
      return null;
    }
    int small = findSmallest(a,b,c,d);
    if (small > 100){
      return null;
    }
    else if (a == small){
      t.makePath();
      return maze[x+1][y];
    }
    else if (b == small){
      t.makePath();
      return maze[x][y+1];
    }
    else if (c == small){
      t.makePath();
      return maze[x-1][y];
    }
    else if (d == small){
      t.makePath();
      return maze[x][y-1];
    }
    else{
      return null;
    } 
    
}
      
   int findSmallest(int a, int b, int c, int d){
     if(a < b){
       if(a < c){
         if (a < d){
           return a;
         }
         else{
           return d;
         }
       }
       else{
         if(c < d){
           return c;
         }
         else{
           return d;
         }
       }
     }
     else{
       if(b < c){
         if (b < d){
           return b;
         }
         else{
           return d;
         }
       }
       else{
         if(c < d){
           return c;
         }
         else{
           return d;
         }
       }
     }
   }
       

/*
//dir = true is horozontal
//dir = flase is vertical
boolean makeMazePath(int xpos, int ypos){
  if(maze[xpos][ypos].consDir){
    if(xpos < maze.length){
      if(maze[xpos+1][ypos].isAWall()){
        maze[xpos][ypos].makePath();
        return true;
      }
    }
  }
  else{
    if(ypos < maze.length){
      if(maze[xpos][ypos+1].isAWall()){
        maze[xpos][ypos].makePath();
        return true;
      }
    }
  }
  return false;
}
*/
    
      

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
    boolean isWall, consDir;
    int wgt;
    
    
    Tile(int xcor, int ycor, boolean type){
        x = xcor;
        y = ycor;
        isWall = type;
    }
    
    void setWgt(int val){
      wgt = val;
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