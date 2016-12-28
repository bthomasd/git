#! usr/bin/env python3

# Fibonacci algorithm

def naive_fib(n):
    if n <= 1:
        return n
    else:
        return naive_fib(n - 1) + naive_fib(n - 2)

fib_memo = []

def fib_memoize(n)
    fib_memo.append(0)
    fib_memo.append(1)

    for i in range(2, n):
        fib_memo.append(fib[i - 1] + fib[i - 2])

    return fib_memo[n]
