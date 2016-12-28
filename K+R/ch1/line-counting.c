// 1.5.3 Line Counting program.

#include <stdio.h>

int main() {
  int c, num_lines;

  num_lines = 0;

  printf("Line Counting Program\n");
  printf("Enter some text, and press Ctrl-D when finished\n");

  while((c = getchar()) != EOF) {
    if (c == '\n') {
      ++num_lines;
    }
  }

  printf("Number of lines: %d\n", num_lines);
  
  return 0;
}
