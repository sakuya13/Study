s = eval(input("Enter the number of lines: "))
for i in range(1, s + 1):
    for l in range(s, 0, -1):
        if l > i:
            print(format(" ", "3s"), end="")
        else:
            print(format(l, "3d"), end="")
    for r in range(2, s + 1):
        if r > i:
            print(format(" ", "3s"), end="")
        else:
            print(format(r, "3d"), end="")
    print()
