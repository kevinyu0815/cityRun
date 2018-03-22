class Octopus {
  float x, y;
  float w, h;
  float opacity = 255;

  Octopus(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {

    if (dist(player.x, player.y, x, y) < 800)
    {
      x -= 5;
      y -= 5;
      w += 10;
      h += 10;

      if (w >= 500 && h >= 500 )
      {
        w = 500;
        h = 500;
        x = 9775;
        y = 0;
      }
      image(octopus, x, y, w, h);
    }
  }

  void becomeBlack() {
    if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {
      if (opacity <= 100)
      {
        transSpeed = 5;
        x = 0;
        y = 0;
      } else {
        transSpeed = 0;
        noStroke();
        fill(0, opacity);
        rect(player.x-140, 0, 1100, 500);      
        opacity -= (abs(mouseX-pmouseX))/100;
      }
    }
  }
}