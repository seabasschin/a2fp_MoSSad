
//Player bob = new Player();
Tile[][] maze = new Tile[24][24];

void setup(){
    size(600,600);
  
}

void draw(){
   background(255,255,255);
    
   makeMaze();
   
   display();
    
    
    
}

void makeMaze(){
  int xcor = 0;
  int ycor = 0;
  for(int i = 0; i < maze.length; i++){
     for(int j = 0; j < maze[i].length; j++){
         maze[i][j] = new Tile(xcor,ycor,true);
         xcor += 25;
     }
     ycor += 25;
  }
}

void display(){
  for (Tile[] i : maze){
    for(Tile j : i){
      j.displayTile();
    }
  }
}


class Tile{
    private int x,y;
    boolean isWall;
    
    Tile(int xcor, int ycor, boolean type){
        x = xcor;
        y = ycor;
        isWall = type;
    }
    
    void makeWall(){
        isWall = true;
    }
    
    void makePath(){
         isWall = false;
    }
    
    void displayTile(){
       if(isWall){
         fill(0,0,0);
         rect((float)x, (float)y, 25.0,25.0);
        }
        else{
         fill(0,0,0);
         rect((float)x, (float)y, 25.0,25.0);
        }
    }
}
       
     





/*
class Player{
    float x,y;
    
    Player(){
      x = 0.0;
      y = 0.0;
    }
      
    void MoveDown(){
        
      if( y + 25.0 < 600){
        y = y + 25.0;
      }
    }
    
    void display(){
      rect(x,y,25,25);
    }
}
*/