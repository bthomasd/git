int ledBlue = 11;
int ledRed = 12;
int ledYellow = 8;
int ledGreen = 9;

void setup() {
  pinMode(ledBlue, OUTPUT);
  pinMode(ledRed, OUTPUT);
  pinMode(ledYellow, OUTPUT);
  pinMode(ledGreen, OUTPUT);
}

void loop() {
  digitalWrite(ledBlue, HIGH);
  delay(50);
  digitalWrite(ledBlue, LOW);
  
  digitalWrite(ledRed, HIGH);
  delay(50);
  digitalWrite(ledRed, LOW);

  digitalWrite(ledYellow, HIGH);
  delay(50);
  digitalWrite(ledYellow, LOW);

  digitalWrite(ledGreen, HIGH);
  delay(50);
  digitalWrite(ledGreen, LOW);
  
}
