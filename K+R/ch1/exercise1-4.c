// Exercise 1-4: Print a Celsius to Fahrenheit table.

#include <stdio.h>

int main() {
  double celsius, fahr;
  int lower, upper, step;

  lower = 0;
  upper = 100;
  step = 5;

  celsius = lower;

  // Heading
  printf("Celsius-to-Fahrenheit Table\n");
  printf("Celsius\tFahr\n");
  printf("-------\t----\n");

  while(celsius <= upper) {
     fahr = ((9 / 5) * celsius) + 32;
     printf("%7.0f\t%.2f\n", celsius, fahr);
     celsius += step;
  }

  return 0;
}
