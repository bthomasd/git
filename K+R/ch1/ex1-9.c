// Exercise 1-9: Write a program to copy input to output, replacing multiple blanks by single blank.
#include <stdio.h>

int main() {
  int c;
  int ns = 0;

  printf("Remove Consecutive Spaces\n");
  printf("Enter some text with multiple spaces in a row, then push Ctrl-D to quit\n");
  
  while((c = getchar()) != EOF) {
    if (c != ' ') {
      putchar(c);
      ns = 0;
    } else if ((c == ' ') && (ns == 0)) {
      putchar(c);
      ns++;
    } else if (ns > 0) {
      continue;
    }
  }
  
  return 0;
}
