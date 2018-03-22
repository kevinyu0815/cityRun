class Bonus extends Item{
  int speed = 10;
  Bonus(float x, float y, float w, float h){
    super(x,y,w,h);
  }
  
  void display(){
    if(isAlive == true){
      y += speed;
      if (y+200 > 420 || y < 0)speed *= -1;
      image(bonus, x, y);
    }
    
  }
  
  void checkCollision(Player player){
    if( isHit(x, y, w, h, player.x, player.y, player.w, player.h)  ){
      if(isAlive){
        bonusCount++;
      }
      super.checkCollision(player);  
    } 
  }
  
  
  }