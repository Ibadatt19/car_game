float rectX;
primary_car car;

void setup() {
  size(1080, 720);
  rectX = width;
  car = new primary_car();
}

void draw() {
   background(144, 238, 144);

  // Translate for the moving rectangle
  rectX -= 2;
  if (rectX < -50) {
    rectX = width;
  }
  fill(150);
  rect(-1,50,1100,600);
  //DOING THE 2D TRANSLATION AS ASKED
  translate(rectX, height / 2);
  fill(255,255,255);
  rect(-25, -25, 200, 30);
  rect(-525, -25, 200, 30);
  rect(-1025, -25, 200, 30);
  translate(-rectX, -height / 2); // Reset the translation
  
  // Draw the car
  fill(255, 100, 0); // Orange
  car.body(190, 70, 380, 70, 480, 120, 80, 120);
  fill(0, 0, 0);
  car.wheels(car.Common_x_position + 160, car.Common_y_position + 120, 40, 40);
  car.wheels(car.Common_x_position + 380, car.Common_y_position + 120, 40, 40);

  // Draw the car collision check
  car.check_collision();

  // Draw anything else after the car collision check, if needed
  car.controlCar();
  car.call_opponent();
  
}
