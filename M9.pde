/**
 *  
 * M9: Casual Creator
 * Amanda Smith 
 *  
 * Creates star background and allows the user to connect the stars to create their own constellations. 
 * When the user presses down on the mouse, they can draw the connecting lines and when they want to
 * erase they should move the mouse around, but not hold down and retrace old lines. 
 *
 */
 
// Array list that holds all the stars
ArrayList<Star> stars = new ArrayList<Star>(); 

void setup() {
  size(500, 500);
  //  Places the canvas on the same part of my screen every time. 
  surface.setLocation(950, -100);
  // Draws all geometeries with aliased edges. 
  noSmooth();
  // Set black background. 
  background(0);
  
  int num_stars = 0;
  while (num_stars < 1000) {
    // Create new Star and add that to the ArrayList. 
    Star star = new Star(); 
    stars.add(star);
    // Increase the total number of stars on the screen.
    num_stars++;
  }
}

class Star { 
  // Class that describes 2D/3D vectors and holds the position of this Star.  
  private PVector position;
  
  // The size of the Star. 
  private float size; 
  
  // The color of the Star. 
  private float hue; 
  
  Star() { 
    // Random width and height of this Star. 
    float w = random(width);
    float h = random(height);
    
    // The position of this star. 
    this.position = new PVector(w, h);
    
    // Random size between 0 and 4
    this.size = random(0, 4);
    
    // Random color that depends on the size, larger stars should be whiter/brighter.  
    this.hue = random(255 * this.size); 
  }
  
  void display() {
    // Specifies the fill color for our Star.  
    stroke(this.hue);
    
    // Sets the width for our Star. 
    strokeWeight(this.size); 
    
    // Draws one point on the screen to represent our Star. 
    point(this.position.x, this.position.y);
  }
}

void draw() {
  // Pauses the drawing program when you press the up arrow key and allows user to save/screenshot work.  
  if (keyCode != UP) {
    
    // Loops through every Star created and displays them on the screen. 
    for(Star star: stars) {
      star.display();
    } 
    
    // Sets the stroke width for the constellation lines. 
    strokeWeight(4);
    
    // When the mouse has been pressed, program draws white connecting lines on the screen. 
    if (mousePressed == true) { 
      stroke(255);  
      line(mouseX, mouseY, pmouseX, pmouseY);
      
    // Functions like an eraser. When the user does not hold down the mouse, the program 
    // draws black lines and can be used to cover old lines. 
    } else { 
      stroke(0); 
      line(mouseX, mouseY, pmouseX, pmouseY);
    } 
  }
}
