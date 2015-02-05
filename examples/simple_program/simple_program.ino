
void setup() {
  Serial.begin(9600);
  while (!Serial);
  Serial.println("Counting down from 10:");
}

int i = 10;

void loop() {
  Serial.println(i--);
  delay(100);
  if (i < 0) {
    Serial.end();
  }
}

