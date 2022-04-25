/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 https://www.arduino.cc/en/Tutorial/LibraryExamples/Sweep
*/

#include <Servo.h>

Servo myservo;
int powerpin = 9;
int servopin = 8;
int t = 8*60*60*60*1000
bool a = true;

void setup() {
  myservo.attach(servopin);
  pinMode (powerpin, OUTPUT);
}


void loop() {
  if (a == true) {
      myservo.write(45);
      delay(500);
      digitalWrite(powerpin, HIGH);
      delay(2000);
      digitalWrite(powerpin, LOW);
      delay(31000);
      myservo.write(180);
      delay(1500);
      myservo.write(45);
  }
  a = false;
}
