
def f(n):
    a, b = 0, 1
    for i in range(n):
        a, b = b, a + b
        print(a, end=" ")

f(10)
print('-'*10)
def f(n):
    a, b = 0, 1
    for i in range(n):
        c = a+b
        a = b
        b = c
        
        
        print(a, end=" ")

f(10)
