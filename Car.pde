class Car{
  float x, y;
  int i = (int)random(0,3);
  
  Car(float x, float y){
    this.x = x;
    this.y = y;
  }

  void display(){
     image(carColor[i], x, y);
  }
  
  void checkCollision(Player player){
   if (isHit(x, y, 50, 50, player.x, player.y, player.w, player.h) && !player.isBig && !player.superSpeed){
      x = -100;
      heartX -= 20;
      player.isTransparent = true;
    }
  }
  
  void fastMove(){
    if(x- player.x + player.w < 360){
      x -= 5;
    }
  }
 
}
 