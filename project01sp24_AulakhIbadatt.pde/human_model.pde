
class human_model {
  
  void body_design(){
      // Set the stroke for the entire sketch
    stroke(0); // Black color for the stroke
    strokeWeight(2); // Set the stroke weight
    
    // Draw a rectangle for arms
    fill(255, 220, 180); // Fill color (blue in this case)
    rect(350, 250, 460, 20);
    
    // Draw a rectangle for leg1
    fill(255, 220, 180); // Fill color (blue in this case)
    rect(510, 330, 20, 90);
    
    // Draw a rectangle for leg2
    fill(255, 220, 180); // Fill color (blue in this case)
    rect(610, 330, 20, 90);
    
    //ellipsefor the body
    fill(255,0,0);
    ellipse(570,270,150,160);
    // Drwaing Shorts
    fill(255, 255, 0); // yellow
    rect(500, 300, 140, 70); 
    
    int x=170;
    fill(255, 220, 180);
    ellipse(400+x, 200, 190, 100); // Draw an ellipse for the face
    
    drawPartialStroke(300+x, 200, 40, 40, radians(60), radians(300)); //partial stroke of black color for the left ear
    drawPartialStroke(500+x, 200, 40, 40, radians(240), radians(490)); //partial stroke for the rightt ear
    
    
    fill(255, 220, 180);
    stroke(255+x, 220, 180); // skin color for stroke
    
    ellipse(300+x, 200, 30, 30); // ear left
    ellipse(500+x, 200, 30, 30); // ear right
  
    
    stroke(0);
    ellipse(350+x, 200, 30, 30);// the left  eye
    ellipse(450+x, 200, 30, 30);// the right eye
    
    fill(255); 
    rect(337+x, 195, 25, 10);
    
    fill(255); 
    rect(437+x, 195, 25, 10);
    
    drawPartialStroke(350+x, 172, 30, 40, radians(210), radians(370));
    drawPartialStroke(375+x, 167, 30, 40, radians(210), radians(370));
    drawPartialStroke(400+x, 162, 30, 40, radians(210), radians(370));
    drawPartialStroke(425+x, 162, 30, 40, radians(210), radians(375));
    drawPartialStroke(453+x, 165, 30, 40, radians(210), radians(380));
    
    //NOSE
    // Define the vertices of the smaller isosceles triangle
    float x1 = 170+x;
    float y1 = 210;
    float x2 = 140+x;
    float y2 = 190;
    float x3 = 170+x;
    float y3 = 210;
  
    // Draw only the hypotenuse of the isosceles triangle FOR NOSE
    //line(x1, y1, x2, y2); // Line connecting vertex 1 and vertex 2 (base/hypotenuse)
    line(x1+250, y1, x2+250, y2+20); // Line connecting vertex 1 and vertex 3 (side)
    line(x2+250, y2, x3+250, y3); // Line connecting vertex 2 and vertex 3 (side)
    
    // making the SMILE
    noFill(); // Don't fill the shape
    stroke(0); // Set the stroke color to black
    arc(400+x, 230, 50,25, 0, PI); // Draw a semi-circle (smile)
    
    
    // EYE balls
    fill(0); // Set the fill color to black
    x1 = 450 + sin(frameCount * 0.08) * 10; // Update the position of the first ellipse with sin function
    x2 = 350 + sin(frameCount * 0.08) * 10; // Update the position of the second ellipse
    ellipse(x1+x, 200, 4, 4); // Draw the first circle at (150, height/2) with a diameter of 50
    ellipse(x2+x, 200, 4, 4); // Draw the second circle at (350, height/2) with a diameter of 50
  

  }
  void drawPartialStroke(float x, float y, float w, float h, float startAngle, float stopAngle) {
  fill(255, 220, 180); // No fill for the arc
  stroke(0); // Black color for the stroke
  strokeWeight(2); // Set the stroke weight
  arc(x, y, w, h, startAngle, stopAngle);
  }
}
