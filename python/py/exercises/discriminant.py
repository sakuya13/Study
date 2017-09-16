from math import sqrt
a, b, c = eval(input("Enter a, b, c: "))
discriminant = b ** 2 - 4 * a * c
if discriminant > 0:
    r1 = (-b + sqrt(b ** 2 - 4 * a * c)) / 2 * a
    r2 = (-b - sqrt(b ** 2 - 4 * a * c)) / 2 * a
    print("The roots are", format(r1, ".6f"), "and", format(r2, ".6f"))
elif discriminant == 0:
    r3 = -b / 2 * a
    print("The root is", format(r3, ".6f"))
else:
    print("The equation has no real roots")
