integer = int(input("Enter a positive integer: "))

def sumDigit(integer):
    s = 0
    while integer > 0:
        s = s + integer % 10
        integer = integer // 10
    return s

print("The sum of the digits is %.0d." % sumDigit(integer))

