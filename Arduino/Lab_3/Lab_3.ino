//Declare I/Os and 

int potAnalogPin = 1;
int ledPin = 2;
int ledPin2 = 3;
int ledPin3 = 4;
int ledPin4 = 5;
int pot, bin0, bin1, bin2, bin3, dec;

void setup() {

  //Initialize the four leds as output devices.
  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  
}

void loop() {

  pot = analogRead(potAnalogPin);
  dec = pot / 64;

  if (dec == 0) {
    bin0 = 0;
    bin1 = 0;
    bin2 = 0;
    bin3 = 0;
  }

  else if (dec == 1) {
    bin0 = 1;
    bin1 = 0;
    bin2 = 0;
    bin3 = 0;
  }

  else if (dec == 2) {
    bin0 = 0;
    bin1 = 1;
    bin2 = 0;
    bin3 = 0;
  }
  else if (dec == 3) {
    bin0 = 1;
    bin1 = 1;
    bin2 = 0;
    bin3 = 0;
  }
  else if (dec == 4) {
    bin0 = 0;
    bin1 = 0;
    bin2 = 1;
    bin3 = 0;
  }
  else if (dec == 5) {
    bin0 = 1;
    bin1 = 0;
    bin2 = 1;
    bin3 = 0;
  }
  else if (dec == 6) {
    bin0 = 0;
    bin1 = 1;
    bin2 = 1;
    bin3 = 0;
  }
  else if (dec == 7) {
    bin0 = 1;
    bin1 = 1;
    bin2 = 1;
    bin3 = 0;
  }
  else if (dec == 8) {
    bin0 = 0;
    bin1 = 0;
    bin2 = 0;
    bin3 = 1;
  }
  else if (dec == 9) {
    bin0 = 1;
    bin1 = 0;
    bin2 = 0;
    bin3 = 1;
  }
  else if (dec == 10) {
    bin0 = 0;
    bin1 = 1;
    bin2 = 0;
    bin3 = 1;
  }
  else if (dec == 11) {
    bin0 = 1;
    bin1 = 1;
    bin2 = 0;
    bin3 = 1;
  }
  else if (dec == 12) {
    bin0 = 0;
    bin1 = 0;
    bin2 = 1;
    bin3 = 1;
  }
  else if (dec == 13) {
    bin0 = 1;
    bin1 = 0;
    bin2 = 1;
    bin3 = 1;
  }
  else if (dec == 14) {
    bin0 = 0;
    bin1 = 1;
    bin2 = 1;
    bin3 = 1;
  }
  else if (dec == 15) {
    bin0 = 1;
    bin1 = 1;
    bin2 = 1;
    bin3 = 1;
  }


  if (bin0 == 1) {
    digitalWrite(ledPin, HIGH);
  }
  else {
    digitalWrite(ledPin, LOW);
  }
  
  if (bin1 == 1) {
    digitalWrite(ledPin2, HIGH);
  }
  else {
    digitalWrite(ledPin2, LOW);
  }
  
  if (bin2 == 1) {
    digitalWrite(ledPin3, HIGH);
  }
  else {
    digitalWrite(ledPin3, LOW);
  }
  
  if (bin3 == 1) {
    digitalWrite(ledPin4, HIGH);
  }
  else {
    digitalWrite(ledPin4, LOW);
  }
}
