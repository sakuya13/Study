
def f(n):
    a, b = 0, 1
    for i in range(n):
        a, b = b, a + b  # assignment is right associated： first finish
        # calculate the tuple on the right, then assign it to the left
        print(a, end=" ")

f(10)


def f(n):
    a, b = 0, 1
    for i in range(n):
        c = a+b  # if there's no tuple used, must assign a new variable c
        a = b
        b = c
        print(a, end=" ")

f(10)
