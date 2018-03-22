class Monkey{
  float x, y;
  float w =76;
  float h = 100;
  float bananaX_original;
  float bananaX;
  float bananaY;
  float bananaSpeed;
  
  Monkey(float x, float y){
    this.x = x;
    this.y = y;
    bananaX_original = x+30;
    bananaY = y+65;
    
  }

  void display(){
     image(monkey, x, y);
  }
  
  void checkCollision(){
   if (isHit(x, y, w, h, player.x, player.y, player.w, player.h) && !player.isBig && !player.superSpeed){
      x = -100;
      heartX -= 20;
      player.isTransparent = true;
    }
  }
    
  void bananaAppear(){
    //banana appears in the front of the man
    
    if(x - player.x <= 800 ){
      if (isHit(bananaX, bananaY, 30, 30, player.x, player.y, player.w, player.h) && !player.isBig && !player.superSpeed ){
      x = -100;
      heartX -= 20;
      player.isTransparent = true;
    }else{
        bananaSpeed = bananaSpeed - 1;
        bananaX = bananaX_original+bananaSpeed;
      image(banana, bananaX, bananaY);
      }
    }
    
     
    
  }
  
}