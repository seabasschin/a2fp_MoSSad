class Car { 
 color c;
 float xpos;
 float ypos;
 float speed;

 Car(color col, float x, float y, float sp) {
   c = col;
   xpos = x*625;
   ypos = y;
   if (x == 0) {
     speed = sp;
   }
   else {
     speed = -sp;
   }
 }

 void display() {
   stroke(0);
   fill(c);
   rect(xpos, ypos, 70, 40);
   ellipse(xpos,ypos,70,40);
 }

 void move() {
   xpos = xpos + speed;
   if (xpos <0) {speed = -speed;}
   if (xpos > width) {speed = -speed;}
 }
 
 boolean crash(Frog frogger){
      //colision detection of frog and car
   if ((frogger.getY() >= ypos && frogger.getY() <= ypos + 10 && frogger.getX() >= xpos && frogger.getX() <= xpos + 20) 
   || (frogger.getY() + 10 >= ypos && frogger.getY() + 10 <= ypos + 10 && frogger.getX() >= xpos && frogger.getX() <= xpos + 20) 
   || (frogger.getY() >= ypos && frogger.getY() <= ypos + 10 && frogger.getX() + 10 >= xpos && frogger.getX() + 10 <= xpos + 20) 
   || (frogger.getY() + 10 >= ypos && frogger.getY() + 10 <= ypos + 10 && frogger.getX() + 10 >= xpos && frogger.getX() + 10 <= xpos + 20)) {
          return true;
     } else {
       return false;
     }
 }
   } 