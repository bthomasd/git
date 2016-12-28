// Exercise 3: Print with a heading.
// Prints a table of Fahrenheit to Celsius values.


#include <stdio.h> // Uses standard i/o library.

#define UPPER 300
#define LOWER 0      // Previously, our int variables.
#define STEP 20

int main() {
  double fahr, celsius;

  /*
  int lower, upper, step;

  lower = 0;
  upper = 300;    // Use symbolic constants for these types of values.
  step = 20;
  */

  fahr = LOWER;

  // Heading.
  printf("Fahr\tCelsius\n");
  printf("----\t-------\n");

  while(fahr <= UPPER) {
    celsius = 5 * (fahr - 32) / 9;
    printf("%.2f\t%.2f\n", fahr, celsius);
    fahr += STEP;
  }

  return 0;
}
