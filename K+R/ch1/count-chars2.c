// Another version of the character counting program with for loops.

#include <stdio.h>

int main() {
  int c;
  double num_chars;

  printf("Character Counting Program 2\n");
  printf("Enter a character string and press ENTER, then press Ctrl-D\n");

  for (num_chars = 0;(c = getchar()) != EOF; ++num_chars) {
    ;
  }

  printf("Number of characters: %.0f\n", num_chars);

  return 0;
}
