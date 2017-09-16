a = int(input("Enter an integer: "))
b = a + 1

def e(a, b):
    if b == 0:
        return 1
    return e(a, b - 1) * a

print(e(a, b))
