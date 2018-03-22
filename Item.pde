class Item {
  boolean isAlive;
  float x, y, w, h;
  
  Item(float x, float y, float w, float h){
    isAlive = true;
    this.x = x;
    this.y = y; 
    this.w = w;
    this.h = h;
    
  }
  
  void display(){}

  void checkCollision(Player player){
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
      isAlive = false;
    }
}

  
}