// Exercise 1-8: Write a program to count blanks, tabs, and newlines.

#include <stdio.h>

int main() {
  int c, nc;
  int nl = 0;
  int nb = 0;
  int nt = 0;

  printf("Count Characters, Spaces, Lines, Tabs\n");
  printf("Enter some text, then press Ctrl-D\n");
  
  for (nc = 0; (c = getchar()) != EOF; nc++) {
    if (c == ' ') {
      nb++;
    } else if (c == '\n') {
      nl++;
    } else if (c == '\t') {
      nt++;
    }
  }

  printf("Number of characters: %d\n", nc);
  printf("Number of spaces: %d\n", nb);
  printf("Number of lines: %d\n", nl);
  printf("Number of tabs: %d\n", nt);

  return 0;
}
