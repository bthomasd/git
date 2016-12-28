// Copies input to output one character at a time.

#include <stdio.h>

int main() {
  int c;

  c = getchar();

  while(c != EOF) { //EOF is a special integer in stdio.h: "End of File"
    putchar(c);
    c = getchar();
  }

  return 0;
}
