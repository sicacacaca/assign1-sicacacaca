
PImage bg,soilImg,lifeImg,hogImg,soldierImg,robotImg;
float robotX,robotY,soldierX,soldierY,lazerX,lazerY,lazerX2,lazerY2;
final int SOLDIDER_SPEED=1;
final int LAZER_SPEED=2;

void setup() {
	size(640, 480, P2D);
	bg=loadImage("img/bg.jpg");
  hogImg=loadImage("img/groundhog.png");
  soilImg=loadImage("img/soil.png");
  soldierImg=loadImage("img/soldier.png");
  lifeImg=loadImage("img/life.png");
  robotImg=loadImage("img/robot.png");

//robotPosition
  robotX=random(160,560);
  robotY=floor((random(4))+2)*80;

//soilderMoving
  soldierY=floor((random(4))+2)*80;
  soldierX=-80;//fixed

//lazerMoving
  lazerX=robotX+25;
  lazerY=robotY+37;
  lazerX2=lazerX-40;

}

void draw() {
	background(bg);
  image(soilImg,0,160);


//grass
  colorMode(RGB);
  fill(124,204,25);
  noStroke();
  rectMode(CORNERS);
  rect(0,145,640,160);

//sun
  fill(254,184,19);
  strokeWeight(5);
  stroke(255,255,0);
  ellipse(590,50,120,120);

//life
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);

//groundhog
  image(hogImg,width/2-40,80);

//soilder
  soldierX=soldierX+1;
  if(soldierX>=640){
    soldierX=-80;
  }
  image(soldierImg,soldierX,soldierY);

//robot
  image(robotImg,robotX,robotY);

//laser
  stroke(255,0,0);
  strokeWeight(10);
  line(lazerX,lazerY,lazerX2,lazerY);
  lazerX2=lazerX2-2;
  
if(robotX-lazerX2>=15){
  lazerX=lazerX-2;
  }
if(robotX-lazerX2>=160){//over range
  lazerX=robotX+25;
  lazerX2=lazerX;
  }
  }
