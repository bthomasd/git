// Exercise 1-10: Copy input to output, replace tabs, backspaces, backslashes with escape chars.

#include <stdio.h>

int main(int argc, char **argv) {
  int c;

  printf("Replace Tab, Backspace, Backslash with Escape Characters\n");
  printf("Enter some text, press Ctrl-D to quit\n");

  while((c = getchar()) != EOF) {
    if (c == '\t') {
      printf("\\t");
    } else if (c == '\b') {
      printf("\\b");         // Not entirely sure how to represent that on terminal stdin
    } else if (c == '\\') {
      printf("\\\\");
    } else {
      putchar(c);
    }
  }
  
  return 0;
}
