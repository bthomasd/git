// Exercise 1-12: Write a program that prints its input one word per line.

#include <stdio.h>

#define IN 1
#define OUT 0

int main(int argc, char **argv) {
  int c, state;

  state = OUT;

  printf("Print One Word Per Line\n");
  printf("Enter some text and then push Ctrl-D\n");
  
  while ((c = getchar()) != EOF) {
    if (c == ' ' || c == '\n' || c == '\t') {
      state = OUT;
    } else if (state == OUT) {
      state = IN;
      printf("\n");
    }
    putchar(c);
  }
 
  
  return 0;
}
