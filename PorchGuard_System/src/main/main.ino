#include "main.h"
#include "accelerometer.h"
#include "loadcell.h"
#include "proximity.h"
#include "ultrasonic.h"
#include "firebase.h"

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  WiFiInit();
  FirebaseInit();
  accelInit();
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  if (getDistance() < 5) {
    alarmState = true;
    sendState();
    digitalWrite(ledPin, HIGH);
    tone(buzzPin, 2000);
    Serial.print("ALARM!\n");
    Serial.print("Distance: ");
    Serial.print(getDistance());
    Serial.println(" cm");
    delay(100);
    digitalWrite(ledPin, LOW);
    tone(buzzPin,500);
    delay(100);
  }
  else {
    alarmState = false;
    noTone(buzzPin);
    digitalWrite(ledPin,LOW);
  }
  printXYZ();
}
