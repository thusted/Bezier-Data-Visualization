//This sketch is a representation of how often (on a scale of percentage) the members of 
//the senate and house vote in line with Trump's position. 
//Hit any key to toggle between senate and house.

import processing.pdf.*;

PFont font;
Table senate;
Table house;
float x = 0;
int xpos = 0;
int ypos = 750;
int page = 0;

void setup() {
  size(1400, 800);
  house = loadTable("House.csv", "header");
  senate = loadTable("Senate.csv", "header");
  font = createFont("AmericanTypewriter", 48);
  textFont(font);
}

void draw() {
  //Senate data
  if (page == 0) {
    background(20);

    //TOP
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Senate Votes in Line With Trump's Position", width/2, 50);
    for (int i = 0; i < 100; i+=2) {
      pushMatrix();
      translate(100 + i*12, 100);
      rotate(radians(90));
      textAlign(RIGHT);
      textSize(14);
      text(senate.getString(i, 2), 25, 0); //state representation
      popMatrix();
    }

    //DRAW LINES
    for (int i = 0; i < 100; i++) {

      if (senate.getString(i, 1).equals("R")) {
        stroke(255, 0, 0, 60);
        strokeWeight(2);
        noFill();
      }

      if (senate.getString(i, 1).equals("D")) {
        stroke(0, 0, 255, 60);
        strokeWeight(2);
        noFill();
      }

      Float sts = senate.getFloat(i, 3); //senate "Trump score" (%)

      if (sts <= .1) {
        xpos = 225;
      } else if (sts > .1 && sts <= .2) {
        xpos = 325;
      } else if (sts > .2 && sts <= .3) {
        xpos = 425;
      } else if (sts > .3 && sts <= .4) {
        xpos = 525;
      } else if (sts > .4 && sts <= .5) {
        xpos = 625;
      } else if (sts > .5 && sts <= .6) {
        xpos = 725;
      } else if (sts > .6 && sts <= .7) {
        xpos = 825;
      } else if (sts > .7 && sts <= .8) {
        xpos = 925;
      } else if (sts > .8 && sts <= .9) {
        xpos = 1025;
      } else if (sts > .9 && sts <= 1.0) {
        xpos = 1125;
      }

      bezier(100 + i*12, 125, 400, 300, 800, 600, xpos, ypos);
    }
    
    //BOTTOM
    fill(200);
    noStroke();
    rect(200, 750, 50, 5, 5);
    rect(300, 750, 50, 5, 5);
    rect(400, 750, 50, 5, 5);
    rect(500, 750, 50, 5, 5);
    rect(600, 750, 50, 5, 5);
    rect(700, 750, 50, 5, 5);
    rect(800, 750, 50, 5, 5);
    rect(900, 750, 50, 5, 5);
    rect(1000, 750, 50, 5, 5);
    rect(1100, 750, 50, 5, 5);
    textAlign(LEFT);
    textSize(12);
    text("0% - 10%", 200, 770);
    text("10% - 20%", 295, 770);
    text("20% - 30%", 395, 770);
    text("30% - 40%", 495, 770);
    text("40% - 50%", 595, 770);
    text("50% - 60%", 695, 770);
    text("60% - 70%", 795, 770);
    text("70% - 80%", 895, 770);
    text("80% - 90%", 995, 770);
    text("90% - 100%", 1095, 770);
  }

  //House data
  else if (page == 1) {
    background(20);
    
    //BOTTOM
    fill(200);
    noStroke();
    rect(200, 750, 50, 5, 5);
    rect(300, 750, 50, 5, 5);
    rect(400, 750, 50, 5, 5);
    rect(500, 750, 50, 5, 5);
    rect(600, 750, 50, 5, 5);
    rect(700, 750, 50, 5, 5);
    rect(800, 750, 50, 5, 5);
    rect(900, 750, 50, 5, 5);
    rect(1000, 750, 50, 5, 5);
    rect(1100, 750, 50, 5, 5);
    textAlign(LEFT);
    textSize(12);
    text("0% - 10%", 200, 770);
    text("10% - 20%", 295, 770);
    text("20% - 30%", 395, 770);
    text("30% - 40%", 495, 770);
    text("40% - 50%", 595, 770);
    text("50% - 60%", 695, 770);
    text("60% - 70%", 795, 770);
    text("70% - 80%", 895, 770);
    text("80% - 90%", 995, 770);
    text("90% - 100%", 1095, 770); 

    //TOP
    textAlign(CENTER, CENTER);
    textSize(30);
    text("House Votes in Line With Trump's Position", width/2, 50);
    
    //move the mouse to the right side of the sketch to scroll through districts
    if (mouseX < 100) x += 5;
    if (mouseX > width-100) x -= 5;
    translate(x, 0);
   
    for (int i = 0; i < 432; i++) {
      pushMatrix();
      translate(50 + i*20, 100);
      rotate(radians(90));
      textAlign(RIGHT);
      textSize(14);
      text(house.getString(i, 2), 25, 0); //district representation
      popMatrix();
    }

    //DRAW LINES
    for (int i = 0; i < 432; i++) {
      pushMatrix();
      translate(50 + i*20, 100);

      if (house.getString(i, 1).equals("R")) {
        stroke(255, 0, 0, 60);
        strokeWeight(2);
        noFill();
      }

      if (house.getString(i, 1).equals("D")) {
        stroke(0, 0, 255, 60);
        strokeWeight(2);
        noFill();
      }
      popMatrix();

      Float hts = house.getFloat(i, 3); //house "Trump score" (%)

      if (hts <= .1) {
        xpos = 225;
      } else if (hts > .1 && hts <= .2) {
        xpos = 325;
      } else if (hts > .2 && hts <= .3) {
        xpos = 425;
      } else if (hts > .3 && hts <= .4) {
        xpos = 525;
      } else if (hts > .4 && hts <= .5) {
        xpos = 625;
      } else if (hts > .5 && hts <= .6) {
        xpos = 725;
      } else if (hts > .6 && hts <= .7) {
        xpos = 825;
      } else if (hts > .7 && hts <= .8) {
        xpos = 925;
      } else if (hts > .8 && hts <= .9) {
        xpos = 1025;
      } else if (hts > .9 && hts <= 1.0) {
        xpos = 1125;
      }
      
      bezier(50 + i*20, 125, 400 - x, 300, 600 - x, 500, xpos - x, ypos - 2);
    }
  }
}



void keyPressed() {
  page++;
  if (page == 2) {
    page = 0;
  }
}