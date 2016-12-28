// Exercise 1.6, 1.7: Verify and print value of EOF

#include <stdio.h>

int main() {
  //int c;

  printf("Value of EOF: %d\n", EOF);
  printf("Enter a character: \n");
  printf("Value of getchar() != EOF: %d\n", getchar() != EOF);

  return 0;
}
