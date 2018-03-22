class Coin {
  float x;
  float y;
  
  
  Coin(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  boolean coinMoving(){
    if(dist(x,y,player.x+player.w/2,player.y+player.h/2) < 300) {
      return true;
    }else{
      return false;
    }
    
  }
}
  