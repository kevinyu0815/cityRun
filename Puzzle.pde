class Puzzle{
  PImage puzzle;
  float x, y;
  int index1, index2;
  
  Puzzle(float x, float y, String whichPuzzle, String i, int index1, int index2){
    this.x = x;
    this.y = y;
    this.index1 = index1;
    this.index2 = index2;
    puzzle = loadImage("img/puzzle/" + whichPuzzle +"_" +i +".png");
  }
  
  void display(){
    image(puzzle, x, y);
  }
  
  void move(){
    if(x + 120 > mouseX && x < mouseX && y + 120 > mouseY && y < mouseY){
      if(mousePressed && grabbedPuzzle == null){
        grabbedPuzzle = this;
        originX = x;
        originY = y;
        originIndex = index2;
      }
    }
    
    if(grabbedPuzzle == this){
      x = mouseX-60;
      y = mouseY-60;
    }
  }
  
  
}