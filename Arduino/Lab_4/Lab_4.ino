const int analogPin = 5;
const float bottomRes = 10000.0; //Ohms

void setup() {
//Initialize a serial monitor
  Serial.begin(9600);
  Serial.println("Ohm Meter (bottom must be 10k): \n");

}

void loop() {
  float reading, v1, res;

  reading = (float) analogRead(analogPin);

  //Calculate voltage and resistance.
  v1 = (reading / 1023.0) * 5.0;
  res = (5.0 / v1) * bottomRes - bottomRes;

  //Display in the console.
  Serial.print("Voltage: ");
  Serial.print(v1);
  Serial.print("Resistance:");
  Serial.println(res);

  //Pause
  delay(1000);

}
