def fib(n):
    '''exponential ver'''
    if n == 0:
        return 1
    if n == 1:
        return 1
    return (fib(n - 1) + fib(n - 2))

def fib_linear(n, a=1, b=0):
    '''only need to remember the two latest numbers in the sequence'''
    if n == 0:
        return a
    return fib_linear(n - 1, a + b, a)

def fib_iter(n):
    a = 1
    b = 0
    while n > 0:
        a = a + b
        b = a - b
        n -= 1
    return a

def debug():
    n = 6
    print(fib(6))
    print(fib_linear(6))
    print(fib_iter(6))
 
debug()
