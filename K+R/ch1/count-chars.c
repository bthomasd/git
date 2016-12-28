// 1.5.2 Count characters

#include <stdio.h>

int main() {
  int c;
  long num_chars;

  num_chars = 0;

  printf("Character Counting Program\n");
  printf("Please enter a string of characters followed by ENTER\n");
  printf("Press Ctrl-D on the following line\n");

  while((c = getchar()) != EOF) {
    ++num_chars;
  }

  printf("Number of characters: %ld\n", num_chars);

  return 0;
}
