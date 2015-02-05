
#include "Arduino.h"
#include "my_silly_library.h"

void use_the_library(int times) {
  int i;
  for (i = 0; i < times; ++i) {
    Serial.println("I never thought you would actually use me!");
  }
}
