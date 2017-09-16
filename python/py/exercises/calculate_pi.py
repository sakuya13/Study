l = int(input("Enter an integer: "))

def calculate_pi(n):
    s = 0
    for i in range(n):
        if i % 2 == 1:
            a = -1 * (1 / (2 * i + 1))
        else:
            a = 1 / (2 * i + 1)
        s = s + a
        p = 4 * s # return 4 * s
    return p

print("PI is: %.0d." % calculate_pi(l))
