class Heart extends Item{
Heart(float x, float y, float w, float h){
    super(x,y,w,h);
  }
  
  void display(){
    if(isAlive == true){
      image(heart, x, y);   
  }
  }

void checkCollision(Player player){
    if( isHit(x, y, w, h, player.x, player.y, player.w, player.h)  ){
      if(isAlive && heartX <=180){
          heartX +=20;
        }
      super.checkCollision(player);  
    } 
  }

}