class Button
{
  int x1, y1 ,y2;
  float x2;
  Button(int x1, int y1, float x2, int y2)
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  void show(int down){
    stroke(1);
    fill(0);
    ellipse(this.x1, this.y1, this.x2, this.y2);
    fill(0,0,200);
    ellipse(this.x1, this.y1 - 5, this.x2 - 2.5, this.y2);
    fill(0,0,255);
    ellipse(this.x1, this.y1 - 15 + down, this.x2 - 2.5, this.y2);
  }
}
