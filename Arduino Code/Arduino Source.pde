/*
 *Robot Control Script for my OpenROV.
 * by Akshai M
 */
#include <AFMotor.h>

AF_DCMotor speed_motor(4, MOTOR12_64KHZ); // create motor #2, 12KHz pwm
AF_DCMotor gear_motor(3, MOTOR12_64KHZ); // create motor #2, 64KHz pwm

char value;
int  speedy = 255;

void setup()
{
  Serial1.begin(115200);        // start serial communication at 115200bps
  Serial.begin(9600);        // start serial communication at 115200bps
  speed_motor.setSpeed(speedy);      // set the speed to 150/255
  gear_motor.setSpeed(255);  
}


void loop() 
{
  
  if( Serial.available() )      // if connection is set
  {
    value = Serial.read();      // read serial bluetooth input
    Serial.print(value);
    Serial.println();

    switch (value)
    {
      case 'w':
        speed_motor.run(FORWARD);
        gear_motor.run(RELEASE);
        break;
      case 's':
  
        speed_motor.run(BACKWARD);
        gear_motor.run(RELEASE);
        break;
      case 'a':
        gear_motor.run(FORWARD);
        break;
      case 'd':
        gear_motor.run(BACKWARD);
        break;
      case 'x':
        speed_motor.run(RELEASE);
        gear_motor.run(RELEASE);
        break;
        
      case 'q':
        slowDown(10);
        break;
      case 'e':
        speedUp(10);
        break;
        
    } 
  }
  
}

void slowDown(int minus)
{
  speedy = (speedy-minus);
  if (speedy <= 100)
  {
    speedy = 100;
  }
  
  speed_motor.setSpeed(speedy);
}

void speedUp(int plus)
{
  speedy = (speedy+plus);
  if (speedy >= 255)
  {
    speedy = 255;
  }
  
  speed_motor.setSpeed(speedy);  
}

