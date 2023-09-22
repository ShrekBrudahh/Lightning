void setup(){
  size(700,700);
  background(0);
  frameRate(100);
  //noLoop();
}
int startX = 0;
int startY = 0;
int endX = 0;
int endY = 0;

int xMax = 30;
int yMax = 30;

int ang = 0;
int num = 1;

boolean act = false;

int incr = 1;

void draw(){
  background(0);
  ang += 1;
  for (int i = 1; i <= incr; i++){
    makeBolt(ang + i*30, i);
  }
  
  textSize(20);
  text("Score: " + incr,20,100);
  if (incr >= 150){
    text("Congrats you passed!",20,50);
    noLoop();
  }else{
    text("How long can your eyes last? Click to increase difficulty",20,50);
  }
}


void resetVals(){
  startX = 0;
  startY = 0;
  endX = 0;
  endY = 0;
}
void mousePressed(){
  incr += 1;
  resetVals();
  //redraw();
  act = true;
}

void rotateAtPoint(int x, int y, float angle){
  pushMatrix();
  translate(x,y);
  angle = angle * PI/180;
  rotate(angle);
 
}

void makeBolt(int ang, int factor){
  rotateAtPoint(width/2,height/2,ang);
  for (int i = 1; i <= 1; i++){
    for (int t = startY; t <= yMax; t++){
      endX = startX + rand(-20,20);
      endY = startY + rand(0,20);
      strokeWeight(factor - factor * t/yMax);
      stroke(rand(0,255),rand(0,255),rand(0,255));
      line(startX,startY,endX,endY);
      startX = endX;
      startY = endY;
    }
    resetVals();
  }
  popMatrix();
}

public int rand(int min, int max){
  return min + (int)(Math.random() * (1+(max - min)));
}

public float clamp(float x, float min, float max){
  if (x < min){
    x = min;
  }else if (x > max){
    x = max;
  }
  return x;
}

