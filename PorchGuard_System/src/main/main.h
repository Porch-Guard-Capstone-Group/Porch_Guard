#include "Wire.h"
#include "SparkFun_MMA8452Q.h"    // Click here to get the library: http://librarymanager/All#SparkFun_MMA8452Q

const int ledPin = 6;
const int buzzPin = 7;
const int trigPin = 8;
const int echoPin = 9;
int address = 0x1D;
byte readValue = 0xFF;

bool alarmState = false;

void setup();
void loop();
