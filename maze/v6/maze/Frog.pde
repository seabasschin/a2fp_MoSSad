class Frog {
int x;
int y;
 
 Frog(int fx, int fy){
   x = fx;
   y = fy;
 }
 
 void showFrog() {
   
fill(130,255,140);
ellipse(x,y,30,10);
 }
 float getX() {
   return x;
 }
 float getY() {
   return y;
 }
 
 void move(){
   if (keyPressed){
   if (keyCode == UP) {
     keyPressed = false;
     if (!(x - 10 < 0)) {
       y -= 20;
     }
   }

   if (keyCode == DOWN) {
     keyPressed = false;
     if (!(x + 10 > height - 10)) {
       y += 20;
     }
   }

   if (keyCode == LEFT) {
     keyPressed = false;
     if (!(x - 10 < 0)) {
       x -= 20;
     }
   }

   if (keyCode == RIGHT) {
     keyPressed = false;
     if (!(x + 10 > width - 10)) {
       x +=20;
     }
   }
   }
 }
 
}