class Icecream{
 float x, y;

  Icecream(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  
  void display(){
     if(dist(player.x, player.y, x,y) < 885)
    {
      if(y < 380){
         y += 3;
         image(icecream,x,y,30,50);
      }
     
       else if(y >= 380)
      {
        image(icecreampour,x,400,60,30);
      }
     
    }
  }
  
  void checkCollision(Player player){
   if (isHit(x, y, 60, 30, player.x, player.y, player.w, player.h) && !player.isBig && !player.superSpeed){
     x = -100;
      heartX -= 20;
      player.isTransparent = true;
    }
  }





}