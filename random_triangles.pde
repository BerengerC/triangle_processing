
/**
 * moving corners of rectangles in a grid

 * KEYS
 * s                   : save png
 * p                   : save pdf
 */


import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

 
int tileCount = 10;
int rectSize = 100;

int actRandomSeed = 0;

// COLORS

int[] r_value = {9,7,4,4,3};
int[] g_value = {169,126,75,54,58};
int[] b_value = {252,189,112,125,87};
    




void setup(){
  size(1000, 1000);
}



void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(RGB);
  background(255);
  smooth();
  noStroke();
  
  

  randomSeed(actRandomSeed);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      
      int i = int(random(4));
      fill(r_value[i],g_value[i],b_value[i],random(50,100));
      
      int posX = 300 + (width-600)/tileCount * gridX;
      int posY = 300 + (height-600)/tileCount * gridY;

      float shiftX1 = random(0, 40) * random(-2, 2);
      float shiftY1 = random(0, 40) * random(-2, 2);
      float shiftX2 = random(0, 40) * random(-2, 2);
      float shiftY2 = random(0, 40) * random(-2, 2);
      float shiftX3 = random(0, 40) * random(-2, 2);
      float shiftY3 = random(0, 40) * random(-2, 2);
      float shiftX4 = random(0, 40) * random(-2, 2);
      float shiftY4 = random(0, 40) * random(-2, 2);
     
      beginShape();
      vertex(posX+shiftX1, posY+shiftY1);
      vertex(posX+rectSize+shiftX2, posY+shiftY2);
      vertex(posX+rectSize+shiftX3, posY+rectSize+shiftY3);
      //vertex(posX+shiftX4, posY+rectSize+shiftY4);
      endShape(CLOSE);
    }
  } 
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void mousePressed() {
  actRandomSeed = (int) random(100000);
}


void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
