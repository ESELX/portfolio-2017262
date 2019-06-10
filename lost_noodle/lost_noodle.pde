float[] x = new float[400]; 
float[] y = new float[400]; 
float segLength = 5;
int dim;

boolean record;

void setup() {
  size(1480, 800); 
  record = false; 
}

void draw() {
  
  if (record) 
  {
    beginRecord(PDF, "snake-####.pdf");
  }
  background(290, 225, 150); 
  
   ellipse(1200,280,180,180);
  fill(244,147,40);
  
  ellipse(250,200,200,200);
  fill(233,104,92);
  
  ellipse(200,500,100,100);
  fill(104,158,81);
  
   ellipse(800,150,100,100);
  fill(244,147,40);
  
    ellipse(600,300,150,150);
  fill(104,158,81);
  
    ellipse(1000,500,200,200);
  fill(233,104,92);
  
  strokeWeight(15); 
  strokeCap(PROJECT);
  stroke(255, 290, 250); 
  

  dragSegment(0, mouseX, mouseY); 


  for (int i=0; i<x.length-100; i++) { 
    dragSegment(i+ 1, x[i], y[i]);
  }

  if (record)
  {
    record = false;
    endRecord();
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx); 
  x[i] = xin - cos(angle) * segLength; 
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) { 
  pushMatrix(); 
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void keyPressed() {
  record = true; 
}
