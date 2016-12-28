#! usr/bin/env python3

#import random

n = int(input()) #Reads until \n
a = [int(x) for x in input().split()] # list comp of second line
assert(len(a) == n) # Throw an error if the length of a != num on first line


def max_pairwise_bf(n, a):
    result = 0
    for i in range(0, n):
        for j in range(i + 1, n):
            if a[i] * a[j] > result:
                result = a[i] * a[j]
    return result

def max_pairwise_fast(n, a):
    max_index1 = -1
    max_index2 = -1
    counter = 0

    for i in range(0, n):
        if (max_index1 == -1) or (a[i] > a[max_index1]) :
            max_index1 = i

    for j in range(0, n):
        if (max_index2 == -1):
            max_index2 = j
            if (max_index2 == max_index1):
                max_index2 += 1
        elif (a[j] > a[max_index2]) and (j != max_index1):
            max_index2 = j
            

    return a[max_index1] * a[max_index2]

"""
while(True):
    n = 1000
    a = [random.randint(0, 100000) for i in range(0, n)]
    res1 = max_pairwise_bf(n, a)
    res2 = max_pairwise_fast(n, a)

    if res1 != res2:
        print("Failure")
        print(res1, res2)
        break
    else:
        print("Ok")
        print(res1, res2)
"""

#print(max_pairwise_bf(n, a))
print(max_pairwise_fast(n, a))

