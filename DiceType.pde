class DiceType{
  int x, y, dots;
  DiceType(int x, int y, int dots){
    this.x = x;
    this.y = y;
    this.dots = dots;
  }
  public void show(int shiftX){
    int col = color(255);
    if(toggleColor){
      col = color(random(0,255),random(0,255),random(0,255));
    }
    fill(col);
    beginShape();
    vertex(shiftX + this.x,this.y+10);
    vertex(shiftX + this.x+1,y+5);
    // Top left
    vertex(shiftX + this.x+5,this.y+1);
    vertex(shiftX + this.x+10,this.y);
    //
    vertex(shiftX + this.x+40,this.y);
    vertex(shiftX + this.x+45,this.y+1);
    // Top right
    vertex(shiftX + this.x+49,this.y+5);
    vertex(shiftX + this.x+50,this.y+10);
    //
    vertex(shiftX + this.x+50,this.y+40);
    vertex(shiftX + this.x+49,this.y+45);
    // Bottom right
    vertex(shiftX + this.x+45,this.y+49);
    vertex(shiftX + this.x+40,this.y+50);
    //
    vertex(shiftX + this.x+10,this.y+50);
    vertex(shiftX + this.x+5,this.y+49);
    // Bottom left
    vertex(shiftX + this.x+1,this.y+45);
    vertex(shiftX + this.x,this.y+40);
    endShape(CLOSE);
  }
  public void generate(int numDots, int shifted){
    if(numDots == 1){
      rollOne(shifted);
    }else if(numDots == 2){
      rollTwo(shifted);
    }else if(numDots == 3){
      rollThree(shifted);
    }else if(numDots == 4){
      rollFour(shifted);
    }else if(numDots == 5){
      rollFive(shifted);
    }else if(numDots == 6){
      rollSix(shifted);
    }
  }
  void rollOne(int changeX){
    fill(0);
    ellipse(changeX + this.x + 25, this.y + 25, 10, 10);
  }
  void rollTwo(int changeX){
    fill(0);
    ellipse(changeX + this.x + 12.5, this.y + 12.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 37.5, 10, 10);
  }
  void rollThree(int changeX){
    fill(0);
    ellipse(changeX + this.x + 25, this.y + 25, 10, 10);
    ellipse(changeX + this.x + 12.5, this.y + 12.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 37.5, 10, 10);
  }
  void rollFour(int changeX){
    fill(0);
    ellipse(changeX + this.x + 12.5, this.y + 12.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 12.5, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 12.5, 10, 10);
  }
  void rollFive(int changeX){
    fill(0);
    ellipse(changeX + this.x + 25, this.y + 25, 10, 10);
    ellipse(changeX + this.x + 12.5, this.y + 12.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 12.5, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 12.5, 10, 10);
  }
  void rollSix(int changeX){
    fill(0);
    ellipse(changeX + this.x + 25, this.y + 12.5, 10, 10);
    ellipse(changeX + this.x + 25, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 12.5, this.y + 12.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 12.5, this.y + 37.5, 10, 10);
    ellipse(changeX + this.x + 37.5, this.y + 12.5, 10, 10);
  }
}
