class Milk extends Item{
  
  final float ratio = 1.5;
  final int INIT_MILKTIMER = 5*60; //frames
  int milkTimer = INIT_MILKTIMER;
  
  
 Milk(float x, float y, float w, float h){
    super(x,y,w,h);
  }
  
  void display(){
    if(isAlive == true){
      image(milk,x,y);
    }
  }
  
  void checkCollision(Player player){
    if( isHit(x, y, w, h, player.x, player.y, player.w, player.h) && !player.isBig ){
      super.checkCollision(player);  
      player.isBig = true;
    } 
  }
  
  void growUp(){
    if(player.isBig == true){
      player.w = 70*ratio;
      player.h = 100*ratio;
      milkTimer--;
      if(milkTimer<=0){
        player.w = 70;
        player.h = 100;
        upPressed = true;
        player.speed = 1;
        player.isBig = false;
        milkTimer=INIT_MILKTIMER;
        }
      }
  }
  
 
}

  