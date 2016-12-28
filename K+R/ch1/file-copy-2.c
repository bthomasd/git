// Another version of the input-output copy program.

#include <stdio.h>

int main() {
  int c;

  while((c = getchar()) != EOF) {
    putchar(c);
  }

  return 0;
}
