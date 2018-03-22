class Magnet extends Item{
  
  final int INIT_TIMER = 5*60; //frames
  int powerTimer = INIT_TIMER;
  
  
 Magnet(float x, float y, float w, float h){
    super(x,y,w,h);
  }
  
  void display(){
    if(isAlive == true){
      image(magnet,x,y);
    }
  }
  
   void checkCollision(Player player){
     if( isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
      super.checkCollision(player);
      player.isPower = true;
     }
  }
  
   void powering(){
    if(player.isPower == true){
        powerTimer--;
        if(powerTimer<=0){
          player.isPower = false;
          powerTimer = INIT_TIMER; 
        }
      }
   }
  
   
}