int led1Pin = 11;
int level;
const int analogPin = 5;
const float bottomRes = 10000.0;

void setup() {
  pinMode(led1Pin, OUTPUT);
  Serial.begin(9600);
  Serial.println("Ohm Meter (bottom must be 10k): \n");

}

void loop() {
  float reading, v1, voltage, res;

  reading = (float) analogRead(analogPin);
  v1 = (reading / 1023.0) * 5.0;
  res = (5.0 / v1) * bottomRes - bottomRes;

  level = map(v1, 2, 5, 255, 0);

  analogWrite(led1Pin, level);

  //Display in the console.
  Serial.print("Voltage: ");
  Serial.print(v1);
  Serial.print("Resistance:");
  Serial.println(res);
}
