
Player bob = new Player();

void setup(){
    size(500,500);
  
}

void draw(){
    background(255,255,255);
    bob.display();
    
     if(key == 's' && keyPressed == true){
         bob.MoveDown();
         keyPressed = false;
       }
    
    
    
}

class Player{
    float x,y;
    
    Player(){
      x = 0.0;
      y = 0.0;
    }
      
    void MoveDown(){
        
      if( y + 25.0 < 500){
        y = y + 25.0;
      }
    }
    
    void display(){
      rect(x,y,25,25);
    }
}


class Tile{
    float x;
    float y;
    boolean left;
    boolean right;
    boolean up;
    boolean down;
    
    Tile(int xcor, int ycor){
     x = (float)xcor;
     y = (float)ycor;
    }
}