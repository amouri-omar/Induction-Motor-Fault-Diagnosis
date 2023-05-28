// Arduino code for Induction Motor Fault Diagnosis
// Author: Amouri Omar
// Description: This code reads sensor values from an ACS712 current sensor
// connected to pin A0 on the Arduino board. The values are stored in an array
// and printed to the serial monitor for analysis.

#include <avdweb_AnalogReadFast.h>

int sensorValue[13000];

void setup() {
  // Set up the Arduino board
  pinMode(A0, INPUT);
  Serial.begin(115200);
}

void loop() {
  // Read sensor values and store theme in the array
  for (int i = 0; i < 13000; i++) {
    sensorValue[i] = analogRead(A0) - 43; // Adjusting sensor value offset
    delayMicroseconds(57);
  }

  // Print the sensor values to the serial monitor
  for (int i = 0; i < 13000; i++) {
    Serial.println(sensorValue[i]);
  }

  delay(10000); // Wait for 10 seconds before repeating the loop
}
