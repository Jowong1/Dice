int moveLeft = 0;
int moveMiddle = 0;
int moveRight = 0;
int moveX = 0;
int shift = 0;
int count = 0;
boolean pressedLeft = false;
boolean pressedMiddle = false;
boolean pressedRight = false;
boolean shiftDown = true;
boolean toggleBounce = false;
boolean toggleGenerate = true;
boolean toggleColor = false;
DiceType[][] diceArray = new DiceType[8][5];

public void setup(){
  size(625, 600);
  frameRate(20);
  textAlign(CENTER);
  textSize(20);
}
public void draw(){
  background(111, 226, 120);
  Button left = new Button(150, 555, 102.5, 50);
  Button middle = new Button(300, 555, 102.5, 50);
  Button right = new Button(450, 555, 102.5, 50);
  left.show(moveLeft);
  middle.show(moveMiddle);
  right.show(moveRight);
  if(toggleBounce){
    bounce();
  }
  col1(moveX);
  col2(-moveX);
  for(int row = 0; row < diceArray.length; row++){
    for(int col = 0; col < diceArray[0].length; col++){
      count += diceArray[row][col].dots;
    }
  }
  text("Total Roll: " + count, width/2 - 15,504);
  count = 0;
}
public void col1(int change){
  int rand;
  int x = 25;
  DiceType type1;
  for(int r = 0; r < diceArray.length; r+=2){
    int y = 25;
    for(int c = 0; c < diceArray[0].length; c++){
      if(toggleGenerate){
        rand = (int)(Math.random()*6)+1;
        type1 = new DiceType(x, y, rand);
        diceArray[r][c] = type1;
        type1.show(change);
        type1.generate(rand, change);
      }else{
        type1 = diceArray[r][c];
        rand = type1.dots;
      }
      type1.show(change);
      type1.generate(rand, change);
      y += 100;
    }
    x += 150;
  }
}
public void col2(int change){
  int rand;
  int x = 100;
  DiceType type2;
  for(int r = 1; r < diceArray.length; r+=2){
    int y = 25;
    for(int c = 0; c < diceArray[0].length; c++){
      if(toggleGenerate){
        rand = (int)(Math.random()*6)+1;
        type2 = new DiceType(x, y, rand);
        diceArray[r][c] = type2;
        type2.show(change);
        type2.generate(rand, change);
      }else{
        type2 = diceArray[r][c];
        rand = type2.dots;
      }
      type2.show(change);
      type2.generate(rand, change);
      y += 100;
    }
    x += 150;
  }
}
public void bounce(){
  if(moveX < -13){
       shift = 3;
       shiftDown = false;
     }
  if(moveX > -5 && moveX < 5 && shiftDown == true){
     shift = -1;
   }else if(moveX > -5 && moveX < 5 && shiftDown == false){
     shift = 1;
   }
   if(moveX > 13){
     shift = -3;
     shiftDown = true;
   }
   moveX += shift;
}
public void mousePressed(){
  if(mouseX > 98 && mouseX < 202 && mouseY < 567 && mouseY > 513){
    moveLeft = 10;
    pressedLeft = true;
  }
  if(mouseX > 248 && mouseX < 352 && mouseY < 567 && mouseY > 513){
    moveMiddle = 10;
    pressedMiddle = true;
  }
  if(mouseX > 398 && mouseX < 502 && mouseY < 567 && mouseY > 513){
    moveRight = 10;
    pressedRight = true;
  }
}
public void mouseReleased(){
  if(pressedLeft){
    moveLeft = 0;
    pressedLeft = !pressedLeft;
    toggleBounce = !toggleBounce;
  }
  if(pressedMiddle){
    moveMiddle = 0;
    pressedMiddle = !pressedMiddle;
    toggleGenerate = !toggleGenerate;
  }
  if(pressedRight){
    moveRight = 0;
    pressedRight = !pressedRight;
    toggleColor = !toggleColor;
  }
}
