import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
PImage img;
int x;
int y = -150;

boolean sketchFullScreen() {
  return true;
}

void setup(){
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); 
  size(displayWidth, displayHeight);
  img = loadImage("camping2.jpg");
}

void draw()
{   
    image(img,0,y);
    //y = frameCount;     
    // If data is available, read it and store it in val
    if(myPort.available() > 0){  
      val = myPort.readStringUntil('\n').trim();
      if( val.trim().equals("Up") ){
           if (y != 0){
              y+=2;
           }
      }else if(val.trim().equals("Down")){
        if(y != img.height){
           y-=2; 
        }
      }
  }
}

