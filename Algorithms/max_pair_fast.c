#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
  long long max_pair_naive(int, long long[]);
  long long max_pair_fast(int, long long[]);
  //int n = 0;
  //int nums[100];
  int truth = 0;
  srand(time(NULL));
  
  while(truth == 0) {
    long long res1, res2;
    int n = 1000;
    long long nums[1000];
    
    for (int i = 0; i < n; i++) {
      nums[i] = rand() % 100000;
    }
    
    res1 = max_pair_naive(n, nums);
    res2 = max_pair_fast(n, nums);
   
    if (res1 == res2) {
      printf("Naive: %lli\tFast: %lli\n", res1, res2);
      printf("OK\n");
    }
    else if (res1 != res2) {
      printf("Naive: %lli\tFast: %lli\n", res1, res2);
      printf("Fail\n");
      truth++;
    }
  }  
  /*
  printf("Enter the number of inputs: ");
  scanf("%d", &n);

  printf("Enter list of numbers separated by a space: ");

  for (int i = 0; i < n; i++) {
    scanf("%d", &nums[i]);
  }

  printf("Max pairwise product: %d\n", max_pair_fast(n, nums));
  */
  return 0;
}

long long max_pair_naive(int n, long long nums[]) {
  int result = 0;
  int i_max, j_max;
  for (int i = 0; i < n; i++) {
    for (int j = 1; j < n; j++) {
      if ((nums[i] * nums[j] > result) && (i != j)) {
	result = nums[i] * nums[j];
	i_max = i;
	j_max = j;
      }
    }
  }
  printf("i: %i\tj: %i\n", i_max, j_max);
  return result;
}

long long max_pair_fast(int n, long long nums[]) {
  int max_i, max_j;
  int max = -1;

  for(int i = 0; i < n; i++) {
    if (max < nums[i]) {
      max = nums[i];
      max_i = i;
    }
  }

  max = -1;
  
  for (int j = 0; j < n; j++) {
    if ((max < nums[j]) && (j != max_i)) {
      max = nums[j];
      max_j = j;
    }
  }
  
  if (n == 1) {
    printf("Only one element, %d\n", n);
    return n;
  }
  else if (n == 0) {
    printf("No elements. \n");
    return 0;
  }
  else{
    printf("i: %d\tj: %d\n", max_i, max_j);
  }

  return (long long)(nums[max_i] * nums[max_j]);
}
