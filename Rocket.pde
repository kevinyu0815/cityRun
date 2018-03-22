class Rocket extends Item{
 
  final int INIT_MILKTIMER = 5*60; //frames
  int changeTimer = INIT_MILKTIMER;
 
 Rocket(float x, float y, float w, float h){
    super(x,y,w,h);
  }
  
  void display(){
    if(isAlive == true){
      image(rocket,x,y);
    }
  }
  
  void checkCollision(Player player){
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h) ){
      super.checkCollision(player);
      player.superSpeed = true;
    } 
  }
  
   void isChanging(){
    if(player.superSpeed == true){
      transSpeed=10;
      println(transSpeed);
      changeTimer--;
      if(changeTimer<=0){
        player.superSpeed = false;
        transSpeed=5;
        changeTimer=INIT_MILKTIMER;
          
      }
    }
  }

 
}