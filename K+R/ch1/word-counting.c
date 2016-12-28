// 1.5.4 Word Counting: Where a word is any sequence that doesn't contain a space, newline, tab.

#include <stdio.h>

#define IN 1     // Inside a word
#define OUT 0    // Outside a word

int main(int argc, char **argv) {
  int c, nl, nw, nc, state;

  state = OUT;
  nl = nw = nc = 0;

  printf("Word Counter\n");
  printf("Enter some text, press Ctrl-D when finished\n");
  
  while((c = getchar()) != EOF) {
    ++nc;
    if (c == '\n') {
      ++nl;
    }
    if (c == ' ' || c == '\n' || c == '\t') {
      state = OUT;
    } else if (state == OUT) {
      state = IN;
      ++nw;
    }
  }

  printf("Number of lines: \t%d\n", nl);
  printf("Number of words: \t%d\n", nw);
  printf("Number of characters: \t%d\n", nc);

  return 0;
}
