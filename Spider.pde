class Spider{
  float x, y;

  Spider(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
     if(dist(player.x, player.y, x,y) < 800)
    {
      y += 10;
       if(y >= 0)
      {
        y = 0;
      }
    image(spider, x, y);
     
    }
  }
  
  void checkCollision(Player player){
   if (isHit(x, y, 50, 360, player.x, player.y, player.w, player.h) && !player.isBig && !player.superSpeed){
      heartX -= 20;
      player.isTransparent = true;
    }
  }

}