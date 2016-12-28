int ledPin = 11;
int ledPin2 = 10;
int swPin = 2;
int swPin2 = 3;
int ctrl, ctrl2;

void setup() {

  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(swPin, INPUT);
  pinMode(swPin2, INPUT);
}

void loop() {

  ctrl = digitalRead(swPin);
  ctrl2 = digitalRead(swPin2);

  if ((ctrl == LOW) && (ctrl2 == LOW)) {
    
    digitalWrite(ledPin, LOW);
    digitalWrite(ledPin2, LOW); 
  }
  else if ((ctrl == LOW) && (ctrl2 == HIGH)) {
    
    digitalWrite(ledPin, HIGH);
    delay(300);
    digitalWrite(ledPin, LOW);

    digitalWrite(ledPin2, HIGH);
    delay(300);
    digitalWrite(ledPin2, LOW);
  }
  else if ((ctrl == HIGH) && (ctrl2 == LOW)) {
    
    digitalWrite(ledPin, HIGH);
    delay(30);
    digitalWrite(ledPin, LOW);

    digitalWrite(ledPin2, HIGH);
    delay(30);
    digitalWrite(ledPin2, LOW);
  }
  else if ((ctrl == HIGH) && (ctrl == HIGH)) {
    
    digitalWrite(ledPin, HIGH);
    digitalWrite(ledPin2, HIGH);
  }
}

