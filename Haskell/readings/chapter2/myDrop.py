'''
python version of the Haskell drop function: iterative.
'''
def myDrop(n, elts):
    while n > 0 and elts:
        n -= 1
        elts = elts[1:]
    return elts
