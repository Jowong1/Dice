int check = 0;
int pressed = 0;
int released = 1;
int onOff = 1;
int zeroAndOne = 0;
boolean pressedLeft = false;

Target one;
Target two;
PImage img;
void setup()
{
  size(600,600);
  frameRate(2);
}

void draw()
{
  background(111, 226, 120);
  for(int x = 25; x < 600; x += 100){
    for(int y = 25; y < 500; y += 100){
      Target dice = new Target(x,y);
      dice.show();
    }
  }
  button();
}
void button(){
  fill(0);
  noStroke();
  fill(0,0,255);
  stroke(1);
  frameRate(20);
  
  //Left
  fill(0);
  ellipse(150, 555, 102.5, 50);
  
  fill(0,0,200);
  ellipse(150, 550, 100, 50);
  
  fill(0,0,255);
  ellipse(150, 540 + pressed, 100, 50);
  
  //Middle
  
  fill(0);
  ellipse(300, 555, 102.5, 50);
  
  fill(0,0,200);
  ellipse(300, 550, 100, 50);
  
  fill(0,0,255);
  ellipse(300, 540 + pressed, 100, 50);
  
  //Right
  
  fill(0);
  ellipse(450, 555, 102.5, 50);
  
  fill(0,0,200);
  ellipse(450, 550, 100, 50);
  
  fill(0,0,255);
  ellipse(450, 540 + pressed, 100, 50);
  
  //spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  if(released == 0 && zeroAndOne == 0){
    noLoop();
    released = 1;
    zeroAndOne = 1;
  }
}
void mousePressed()
{
  if(mouseX > 98 && mouseX < 202 && mouseY < 567 && mouseY > 513){
    pressed = 10;
    if(released == 1){
      loop();
    }
    onOffLoop();
    pressedLeft = true;
  }
  
  if(mouseX > 98 && mouseX < 202 && mouseY < 567 && mouseY > 513){
  }
}
void onOffLoop(){
  if(check == 0){
    check = 1;
  }else if(check == 1){
    loop();
    check = 0;
  }
}

void mouseReleased()
{
  if(pressedLeft == true){
    if(pressed != 0){
      pressed = 0;
    }
    released = 0;
  
    if(onOff == 1){
      onOff = 0;
      zeroAndOne = 0;
    }else{
      onOff = 1;
    }
    pressedLeft = false;
  }
}

class Target
{
  int myX, myY;
  Target(int x, int y) //constructor initializes the 3 variables
  {
    //numRings = (int)(Math.random()*3)+1;
    myX = x;
    myY = y;
  }
 void show()
  {
    int siz = 50;
   for(int i = 0; i < 10; i++)
    {
      //fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
      frameRate(2);
      fill(255);
      beginShape();
      vertex(myX,myY+10);
      vertex(myX+1,myY+5);
      //vertex(myX,myY); // Top left
      vertex(myX+5,myY+1);
      vertex(myX+10,myY);
      //
      vertex(myX+40,myY);
      vertex(myX+45,myY+1);
      //vertex(myX+50,myY); // Top right
      vertex(myX+49,myY+5);
      vertex(myX+50,myY+10);
      //
      vertex(myX+50,myY+40);
      vertex(myX+49,myY+45);
      //vertex(myX+50,myY+50); // Bottom right
      vertex(myX+45,myY+49);
      vertex(myX+40,myY+50);
      //
      vertex(myX+10,myY+50);
      vertex(myX+5,myY+49);
      //vertex(myX,myY+50); // Bottom left
      vertex(myX+1,myY+45);
      vertex(myX,myY+40);
      endShape(CLOSE);
      //rect(myX,myY,siz,siz);
      int random = (int)(Math.random()*6)+1;
      if(random == 1){
        rollOne();
      }else if(random == 2){
        rollTwo();
      }else if(random == 3){
        rollThree();
      }else if(random == 4){
        rollFour();
      }else if(random == 5){
        rollFive();
      }else if(random == 6){
        rollSix();
      }
    }

      //rollOne();
      //rollTwo();
      //rollThree();
      //rollFour();
      //rollFour();
      //rollFour();
  }
  void rollOne(){
    fill(0);
    ellipse(myX + 25, myY + 25, 10, 10);
  }
  void rollTwo(){
    fill(0);
    ellipse(myX + 12.5, myY + 12.5, 10, 10);
    ellipse(myX + 37.5, myY + 37.5, 10, 10);
  }
  void rollThree(){
    fill(0);
    ellipse(myX + 25, myY + 25, 10, 10);
    ellipse(myX + 12.5, myY + 12.5, 10, 10);
    ellipse(myX + 37.5, myY + 37.5, 10, 10);
  }
  void rollFour(){
    fill(0);
    ellipse(myX + 12.5, myY + 12.5, 10, 10);
    ellipse(myX + 37.5, myY + 37.5, 10, 10);
    ellipse(myX + 12.5, myY + 37.5, 10, 10);
    ellipse(myX + 37.5, myY + 12.5, 10, 10);
  }
  void rollFive(){
    fill(0);
    ellipse(myX + 25, myY + 25, 10, 10);
    ellipse(myX + 12.5, myY + 12.5, 10, 10);
    ellipse(myX + 37.5, myY + 37.5, 10, 10);
    ellipse(myX + 12.5, myY + 37.5, 10, 10);
    ellipse(myX + 37.5, myY + 12.5, 10, 10);
  }
  void rollSix(){
    fill(0);
    ellipse(myX + 25, myY + 12.5, 10, 10);
    ellipse(myX + 25, myY + 37.5, 10, 10);
    ellipse(myX + 12.5, myY + 12.5, 10, 10);
    ellipse(myX + 37.5, myY + 37.5, 10, 10);
    ellipse(myX + 12.5, myY + 37.5, 10, 10);
    ellipse(myX + 37.5, myY + 12.5, 10, 10);
  }
}
