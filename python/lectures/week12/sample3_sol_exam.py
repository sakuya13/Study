def fun_sqube(num):
#is 'num' both the square and the cube of a natural no.
#It says you take a square of something and a cube of something
#and the square and the cube are equal. eg 64 (8**2 and 4**3)
# 729 (27**2 and 9**3)
    retval = False
    for sq in range(num):
        if sq**2 == num:
            print('sq', sq)
            retval = True
    for cb in range(num):
        if cb**3 == num:
            print('cb', cb)
            return retval
    return False
        
x = 729
fun_sqube(x)
