def fac(n):
    '''recursion'''
    if n == 0:
        return 1
    return fac(n - 1) * n

def fac_iter(n):
    '''iteration'''
    result = 1
    while n > 0:
        result *= n
        n -= 1
    return result

def debug():
    n = 6
    print(fac(n))
    print(fac_iter(n))

debug()
