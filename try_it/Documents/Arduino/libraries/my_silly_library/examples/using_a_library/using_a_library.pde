
#include "my_silly_library.h"

void setup() {
  Serial.begin(9600);
  while (!Serial);
  Serial.println("Using a library:");
  use_the_library(5);
  Serial.end();
}

void loop() {
}





