#! usr/bin/env python3

def gcd(a, b):
    if ((a % b) == 0):
        return b
    else:
        gcd(a, a % b)

        
