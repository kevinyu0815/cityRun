class Player{
  float x, y, w, h, speed;
  boolean isPower=false;
  boolean superSpeed = false;
  boolean isBig = false;
  boolean isTransparent = false;
  int transparentTimer = 30;

  
  PImage role, role1, role2, role3, role4;
  PImage  winImg, loseImg;
  
  int running = 0;
  
  Player(String whichRole){
    role1 = loadImage("img/role/run_right" + whichRole + ".png");
    role2 = loadImage("img/role/run_left" + whichRole + ".png");
    role3 = loadImage("img/role/lie" + whichRole + ".png");
    role4 = loadImage("img/role/lie_big" + whichRole + ".png");
    winImg = loadImage("img/role/win"+whichRole+".png");
    loseImg = loadImage("img/role/lose"+whichRole+".png");
    
     x = 115;
     y = 320;
     w = 70;
     h = 100;
     speed = -17;
  }
  
  void display(){
    if(playerDisplay == true){
      if(running>=0 && running <10){
        role = role1;
      }
      else if(running>=10 && running <20){
        role = role2;
      }
      
      if(isTransparent){
        tint(255, 150);
        transparentTimer --;
      }
      if(transparentTimer < 0){
        isTransparent = false;
        transparentTimer = 30;
      }
      image(role,x,y,w,h);   
      noTint();        
    }
   
    x += transSpeed;
    
    running ++;
    running %= 20;
  }
  
  void jump(){
     if(upPressed == true){
       if (y <= 0 || y < -speed) {
        y = 0;
        speed = 1;
      }
        y += speed;
        speed ++;
        
        if(y+h >= 420){
          y = 420-h;
          upPressed = false;
          speed = -17;
        }
      }
    
  }
  
  void laydown(){
     if (!isBig && downPressed){
      playerDisplay = false;
      role = role3;
      w = 90;
      h = 45;
      y = 375; 
      image(role,x,y,w,h);
    }else if(isBig && downPressed ){
      playerDisplay = false;
      role = role4;
      y = 345; 
      w = 150;
      h = 75;
      image(role,x,y,w,h);
    
    
    }
  }
  
  void win(){
   image(winImg ,0 ,0);
  }
  
  void lose(){
   image(loseImg ,0 ,0);
  }
  
}