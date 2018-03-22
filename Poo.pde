class Poo {
  float x, y;
  
  Poo(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    image(poo, x, y);
  }
  
  void checkCollision(Player player){
   if (isHit(x, y, 50, 50, player.x, player.y, player.w, player.h) && !player.isBig && !player.superSpeed){
      x = -100;
      heartX -= 20;
      player.isTransparent = true;
    }
  }
 }
 
 