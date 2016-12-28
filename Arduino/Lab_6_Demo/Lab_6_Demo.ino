int led1Pin = 11;
int STEPS = 32;
int incStep = 256.0 / STEPS;
int i, level; 

void setup() {
  //Initialize the output LED Pins
  pinMode(led1Pin, OUTPUT);

}

void loop() {
  level = i * incStep; 
  level = constrain(level, 0, 255);
  analogWrite(led1Pin, level);
  delay(300);

  if (i == 32) {
    i = 0;
  }
  else {
    i += 1;
  }
}
