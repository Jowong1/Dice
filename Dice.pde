boolean check = false;
int pressedLeft = 0;
int pressedMiddle = 0;
int pressedRight = 0;
boolean released = true;
boolean onOff = true;
boolean zeroAndOne = false;
boolean pressedLeftClick = false;
boolean pressedMiddleClick = false;
boolean rekt = true;
int moveX = 0;
int moveXSecond = 0;
int diceShiftX = 2;
int diceShiftXSecond = -2;
boolean everyOther = true;
int secondShift = 75;
boolean secondRowOn = false;
boolean shiftDown = true;
boolean shiftDownSecond = false;
boolean checkMiddleOn = false;
boolean checkLeftOn = false;
int randomo = (int)(Math.random()*6)+1;
int checkpoint = 0;
int checker = 0;
int onOffSwitchLeft = 0;
boolean checkNoLoop = true;
int count = 0;
//int randomc = (int)(Math.random()*6)+1;

void setup()
{
  size(600,600);
  frameRate(20);
  //firstDice();
  //secondDice();
}

void firstDice(){
  for(int x = 25; x < 600; x += 150){ //x += 150
    if(moveX < -13){
       diceShiftX = 3;
       shiftDown = false;
     }
    if(moveX > -5 && moveX < 5 && shiftDown == true){
       diceShiftX = -1;
     }else if(moveX > -5 && moveX < 5 && shiftDown == false){
       diceShiftX = 1;
     }
     if(moveX > 13){
       diceShiftX = -3;
       shiftDown = true;
     }
   //moveX = moveX + diceShiftX;

    for(int y = 25; y < 500; y += 100){ //y+=100
      DiceClass first = new DiceClass(x,y);
      //if(rekt != false){
      //first.show();
      if(released == true){
        first.roll();
        //ellipse(100,100,50,50);
      }
      first.show();
      //if(everyOther == true){
      //  everyOther = false;
      //}else{
      //  everyOther = true;
      //}
    }
  }
}

void secondDice(){
  //secondRowOn = true;
  for(int t = 25; t < 600; t += 150){ //x += 150
    if(moveXSecond < -13){
       diceShiftXSecond = 3;
       shiftDownSecond = false;
     }
    if(moveXSecond > -5 && moveXSecond < 5 && shiftDownSecond == false){
       diceShiftXSecond = 1;
     }else if(moveXSecond > -5 && moveXSecond < 5 && shiftDownSecond == true){
       diceShiftXSecond = -1;
     }
     if(moveXSecond > 13){
       diceShiftXSecond = -3;
       shiftDownSecond = true;
     }
   //moveX = moveX + diceShiftX;

    for(int m = 25; m < 500; m += 100){ //y+=100
      DiceClass second = new DiceClass(t,m);
      //if(rekt != false){
      second.show();
      //if(everyOther == true){
      //  everyOther = false;
      //}else{
      //  everyOther = true;
      //}
    }
  }
}


void draw()
{
  background(111, 226, 120);
  if(pressedMiddleClick == true && checkMiddleOn == true){
    secondRowOn = false;
    if(secondRowOn == false){
      firstDice();
      moveX = moveX + diceShiftX;
    }
    secondRowOn = true;
    if(secondRowOn == true){
      secondDice();
      moveXSecond = moveXSecond + diceShiftXSecond;
    }
  }else{
    moveX = 0;
    diceShiftX = 0;
    moveXSecond = 0;
    diceShiftXSecond = 0;
    secondRowOn = false;
    if(secondRowOn == false){
      firstDice();
      moveX = moveX + diceShiftX;
    }
    secondRowOn = true;
    if(secondRowOn == true){
      secondDice();
      moveXSecond = moveXSecond + diceShiftXSecond;
    }
  }
  //if(everyOther == true){
  //      everyOther = false;
  //      fill((int)(Math.random()*256));
  //      text("yes", 150, 50);
  //    }else{
  //      everyOther = true;
  //      fill((int)(Math.random()*256));
  //      text("yes", 200, 50);
  //    }
  button();
}
void button(){
  fill(0);
  noStroke();
  fill(0,0,255);
  stroke(1);
  //frameRate(2);
  
  //Left
  fill(0);
  ellipse(150, 555, 102.5, 50);
  
  fill(0,0,200);
  ellipse(150, 550, 100, 50);
  
  fill(0,0,255);
  ellipse(150, 540 + pressedLeft, 100, 50);
  
  //Middle
  
  fill(0);
  ellipse(300, 555, 102.5, 50);
  
  fill(0,0,200);
  ellipse(300, 550, 100, 50);
  
  fill(0,0,255);
  ellipse(300, 540 + pressedMiddle, 100, 50);
  
  //Right
  
  //fill(0);
  //ellipse(450, 555, 102.5, 50);
  
  //fill(0,0,200);
  //ellipse(450, 550, 100, 50);
  
  //fill(0,0,255);
  //ellipse(450, 540 + pressedRight, 100, 50);
  
  //spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  if(released == false && zeroAndOne == false){
    released = true;
    zeroAndOne = true;
  }
}
void mousePressed()
{
  if(mouseX > 98 && mouseX < 202 && mouseY < 567 && mouseY > 513){
    pressedLeft = 10;
    checker = 1;
    text("Total Dots: " + count, 400,500);
    if(checkNoLoop == true){ //&& rekt == true
      noLoop();
      count = 0;
      checkNoLoop = false;
    }else{
      loop();
      checkNoLoop = true;
    }
    pressedLeftClick = true;
    //if(checkLeftOn == true){
    //  checkLeftOn = false;
    //}else{
    //  checkLeftOn = true;
    //}
  }
  
  if(mouseX > 248 && mouseX < 352 && mouseY < 567 && mouseY > 513){
    pressedMiddle = 10;
    //ellipse(50,50,50,50);
    rekt = false;
    pressedMiddleClick = true;
    if(checkMiddleOn == true){
      checkMiddleOn = false;
    }else{
      checkMiddleOn = true;
    }
    //redraw();
    //noLoop();
  }
}

void mouseReleased()
{
  if(checkLeftOn == true){
      checkLeftOn = false;
    }else{
      checkLeftOn = true;
    }
  if(pressedLeftClick == true){
    if(pressedLeft != 0){
      pressedLeft = 0;
    }
    released = false;
  
    if(onOff == true){
      onOff = false;
      zeroAndOne = false;
    }else{
      onOff = true;
    }
    pressedLeftClick = false;
  }
    if(pressedMiddle != 0){
      pressedMiddle = 0;
    }
}

class DiceClass
{
  int myX, myY , numDots;
  DiceClass(int x, int y) //constructor initializes the 3 variables
  {
    numDots = (int)(Math.random()*6)+1;
    myX = x;
    myY = y;
  }
  void roll(){
    numDots = (int)(Math.random()*6)+1;
  }
  void generator(){
    if(numDots == 1){
      rollOne();
      count = count + 1;
    }else if(numDots == 2){
      rollTwo();
      count = count + 2;
    }else if(numDots == 3){
      rollThree();
      count = count + 3;
    }else if(numDots == 4){
      rollFour();
      count = count + 4;
    }else if(numDots == 5){
      rollFive();
      count = count + 5;
    }else if(numDots == 6){
      rollSix();
      count = count + 6;
    }
  }
  void generatorSecondRow(){
    if(numDots == 1){
      rollOnex();
    }else if(numDots == 2){
      rollTwox();
    }else if(numDots == 3){
      rollThreex();
    }else if(numDots == 4){
      rollFourx();
    }else if(numDots == 5){
      rollFivex();
    }else if(numDots == 6){
      rollSixx();
    }
  }
 void show()
  {
    //int siz = 50;
      //fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
      if(secondRowOn == false){
        firstRow();
        //roll();
        //if(onOffSwitchLeft == 0){
          generator();
        //}
      }else{
        secondRow();
        generatorSecondRow();
      }
      //fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  
  void firstRow(){
    //frameRate(10);
      fill(255);
      beginShape();
      vertex(moveX + myX,myY+10);
      vertex(moveX + myX+1,myY+5);
      //vertex(myX,myY); // Top left
      vertex(moveX + myX+5,myY+1);
      vertex(moveX + myX+10,myY);
      //
      vertex(moveX + myX+40,myY);
      vertex(moveX + myX+45,myY+1);
      //vertex(myX+50,myY); // Top right
      vertex(moveX + myX+49,myY+5);
      vertex(moveX + myX+50,myY+10);
      //
      vertex(moveX + myX+50,myY+40);
      vertex(moveX + myX+49,myY+45);
      //vertex(myX+50,myY+50); // Bottom right
      vertex(moveX + myX+45,myY+49);
      vertex(moveX + myX+40,myY+50);
      //
      vertex(moveX + myX+10,myY+50);
      vertex(moveX + myX+5,myY+49);
      //vertex(myX,myY+50); // Bottom left
      vertex(moveX + myX+1,myY+45);
      vertex(moveX + myX,myY+40);
      endShape(CLOSE);
        //if(checkLeftOn == false){
          //if(numDots == 1){
          //  rollOne();
          //}else if(numDots == 2){
          //  rollTwo();
          //}else if(numDots == 3){
          //  rollThree();
          //}else if(numDots == 4){
          //  rollFour();
          //}else if(numDots == 5){
          //  rollFive();
          //}else if(numDots == 6){
          //  rollSix();
          //}
        //}
  }
  //void generator(){
  //  if(numDots == 1){
  //    rollOne();
  //  }else if(numDots == 2){
  //    rollTwo();
  //  }else if(numDots == 3){
  //    rollThree();
  //  }else if(numDots == 4){
  //    rollFour();
  //  }else if(numDots == 5){
  //    rollFive();
  //  }else if(numDots == 6){
  //    rollSix();
  //  }
 
  void secondRow(){
    //frameRate(10);
      fill(255);
      beginShape();
      vertex(moveXSecond + myX + secondShift,myY+10);
      vertex(moveXSecond + myX+1 + secondShift,myY+5);
      //vertex(myX,myY); // Top left
      vertex(moveXSecond + myX+5 + secondShift,myY+1);
      vertex(moveXSecond + myX+10 + secondShift,myY);
      //
      vertex(moveXSecond + myX+40 + secondShift,myY);
      vertex(moveXSecond + myX+45 + secondShift,myY+1);
      //vertex(myX+50,myY); // Top right
      vertex(moveXSecond + myX+49 + secondShift,myY+5);
      vertex(moveXSecond + myX+50 + secondShift,myY+10);
      //
      vertex(moveXSecond + myX+50 + secondShift,myY+40);
      vertex(moveXSecond + myX+49 + secondShift,myY+45);
      //vertex(myX+50,myY+50); // Bottom right
      vertex(moveXSecond + myX+45 + secondShift,myY+49);
      vertex(moveXSecond + myX+40 + secondShift,myY+50);
      //
      vertex(moveXSecond + myX+10 + secondShift,myY+50);
      vertex(moveXSecond + myX+5 + secondShift,myY+49);
      //vertex(myX,myY+50); // Bottom left
      vertex(moveXSecond + myX+1 + secondShift,myY+45);
      vertex(moveXSecond + myX + secondShift,myY+40);
      endShape(CLOSE);
  }
      //rect(myX,myY,siz,siz);
    void randomizerX(){
      int randomizer = (int)(Math.random()*6)+1;
      if(randomizer == 1){
        rollOnex();
        count = count + 1;
      }else if(randomizer == 2){
        rollTwox();
        count = count + 2;
      }else if(randomizer == 3){
        rollThreex();
        count = count + 3;
      }else if(randomizer == 4){
        rollFourx();
        count = count + 4;
      }else if(randomizer == 5){
        rollFivex();
        count = count + 5;
      }else if(randomizer == 6){
        rollSixx();
        count = count + 6;
      }
    }
  /////
  void rollOnex(){
    fill(0);
    ellipse(moveXSecond + myX + 25 + secondShift, myY + 25, 10, 10);
  }
  void rollTwox(){
    fill(0);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 12.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 37.5, 10, 10);
  }
  void rollThreex(){
    fill(0);
    ellipse(moveXSecond + myX + 25 + secondShift, myY + 25, 10, 10);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 12.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 37.5, 10, 10);
  }
  void rollFourx(){
    fill(0);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 12.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 12.5, 10, 10);
  }
  void rollFivex(){
    fill(0);
    ellipse(moveXSecond + myX + 25 + secondShift, myY + 25, 10, 10);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 12.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 12.5, 10, 10);
  }
  void rollSixx(){
    fill(0);
    ellipse(moveXSecond + myX + 25 + secondShift, myY + 12.5, 10, 10);
    ellipse(moveXSecond + myX + 25 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 12.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 12.5 + secondShift, myY + 37.5, 10, 10);
    ellipse(moveXSecond + myX + 37.5 + secondShift, myY + 12.5, 10, 10);
  }
  
  /////////////
  
  void rollOne(){
    fill(0);
    ellipse(moveX + myX + 25, myY + 25, 10, 10);
  }
  void rollTwo(){
    fill(0);
    ellipse(moveX + myX + 12.5, myY + 12.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 37.5, 10, 10);
  }
  void rollThree(){
    fill(0);
    ellipse(moveX + myX + 25, myY + 25, 10, 10);
    ellipse(moveX + myX + 12.5, myY + 12.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 37.5, 10, 10);
  }
  void rollFour(){
    fill(0);
    ellipse(moveX + myX + 12.5, myY + 12.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 12.5, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 12.5, 10, 10);
  }
  void rollFive(){
    fill(0);
    ellipse(moveX + myX + 25, myY + 25, 10, 10);
    ellipse(moveX + myX + 12.5, myY + 12.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 12.5, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 12.5, 10, 10);
  }
  void rollSix(){
    fill(0);
    ellipse(moveX + myX + 25, myY + 12.5, 10, 10);
    ellipse(moveX + myX + 25, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 12.5, myY + 12.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 12.5, myY + 37.5, 10, 10);
    ellipse(moveX + myX + 37.5, myY + 12.5, 10, 10);
  }
}
