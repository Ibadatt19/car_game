
class primary_car extends human_model {
  int Common_x_position = 10;
  int Common_y_position = 10;
  float distance_btw_cars;

  float[] coordinates; // ArrayList to store coordinates [x1, y1, x2, y2, x3, y3, x4, y4]

  float x = 1080; // Variable to store the x-coordinate of the ellipse
  float y = random(height);
  float count = 0;

  float speed = 3;

  void wheels(int pos_x, int pos_y, int size_1, int size_2) {
    stroke(0); // Black color for the stroke
    strokeWeight(2); // Set the stroke weight
    ellipse(pos_x, pos_y, size_1, size_2);
  }

  void body(int pos_x1, int pos_y1, int pos_x2, int pos_y2, int pos_x3, int pos_y3, int pos_x4, int pos_y4) {
    stroke(0); // Black color for the stroke
    strokeWeight(2); // Set the stroke weight
    // Draw the trapezium body of the car
    beginShape();
    vertex(Common_x_position + pos_x1, Common_y_position + pos_y1); // top left
    vertex(Common_x_position + pos_x2, Common_y_position + pos_y2); // top right
    vertex(Common_x_position + pos_x3, Common_y_position + pos_y3); // bottom right
    vertex(Common_x_position + pos_x4, Common_y_position + pos_y4); // bottom left
    endShape(CLOSE);
    rect(Common_x_position + 190, Common_y_position + 30, 190, 40);
    
    // Store coordinates in the ArrayList
    coordinates = new float[]{Common_x_position + pos_x1, Common_y_position + pos_y1,
                              Common_x_position + pos_x2, Common_y_position + pos_y2,
                              Common_x_position + pos_x3, Common_y_position + pos_y3,
                              Common_x_position + pos_x4, Common_y_position + pos_y4};
  }

  void controlCar() {
    if (key=='a'){
      Common_x_position=Common_x_position+10;
    }
    if (key=='d'){
      Common_x_position=Common_x_position-10;
    }
    if (key=='w'){
      Common_y_position=Common_y_position-10;
    }
    if (key=='s'){
      Common_y_position=Common_y_position+10;
    }
    // Keep the ellipse within the window boundaries on x-axis
    Common_x_position= constrain(Common_x_position, 0, height - 120);
    // Keep the ellipse within the window boundaries on y-axis top
    Common_y_position= constrain(Common_y_position, 0, width - 120);
    Common_y_position= constrain(Common_y_position, 0, height - 220);
    
  }
  float top_left_x;
  float top_left_y;
  
  float bottom_left_x;
  float bottom_left_y;
  
  float top_right_x;
  float top_right_y;
  
  float bottom_right_x;
  float bottom_right_y;
  boolean collision_detected=false;
  void call_opponent() {
    fill(225,0,50);
    rect(x+500,y+30,180,40);
    beginShape();
    vertex(x+500,y+70); // top left
    vertex(x+680,y+70); //bottom right
    vertex(x+780,y+120); // top right 
    vertex(x+400,y+120); // bottom left
    endShape(CLOSE);
    top_left_x=x+500;
    top_left_y=y+70;
    bottom_left_x=x+400;
    bottom_left_y=y+120;
    
    top_right_x=x+780;
    top_right_y=y+120;
    bottom_right_x=x+680;
    bottom_right_y=y+70;
    fill(0,0,0);
    ellipse(x+510,y+120,40,40);
    ellipse(x+680,y+120,40,40);
    
    // Keep the other car within the window boundaries on y-axis top
    y= constrain(y, 0, width - 120);
    y= constrain(y, 0, height - 150);
    
    // Draw the ellipse at the current x-coordinate
    //fill (255,0,0);
    //ellipse(x, y/2, 50, 50);
    
    // Move the ellipse to the left
    if (count<5){
      x = x - 4;
    }
    else if (count % 5 ==0){
      speed=speed+0.0312;
      x= x-speed;
    }
    else {
      x=x-speed;
    }
  
    
    // If the ellipse goes off the left side of the canvas, reset its position to the right
    if (x < -780) {
      count=count+1;
      x = width;
      y=random(height);
    }
    if (collision_detected){
      x=100;
      
      fill (205,5,115);
      rect(50,40,980,400);
      fill(0,0,0);  // Set text color to white
      textAlign(CENTER, CENTER);
      text("GAME OVER", 555, 55);
      textSize(40);
      
      text("HIGH SCORE: " + count, 555, 95);
      textSize(40);
      filter(INVERT);
      body_design();
     
    }
  }

  void check_collision() {
    // Checking collision from front
    for (int i = 0; i < coordinates.length; i += 2) {
      float x_coord = coordinates[i];
      float y_coord = coordinates[i + 1];

      for (float j = bottom_left_x; j <= top_left_x; j++) {
        for (float k = top_left_y; k <= bottom_left_y; k++) {
          if (dist(x_coord, y_coord, j, k) <= 5) {
            collision_detected = true;
          }
        }
      }
    }

    // Checking collision from the back
    for (int i = 6; i < coordinates.length; i += 2) {
      float x_coord = coordinates[i];
      float y_coord = coordinates[i + 1];

      for (float j = bottom_right_x; j <= top_right_x; j++) {
        for (float k = bottom_right_y; k <= top_right_y; k++) {
          if (dist(x_coord, y_coord, j, k) <= 5) {
            collision_detected = true;
          }
        }
      }
    }
  }
}
