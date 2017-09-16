for i in range(1, 7):
    for j in range (1, 7):
        if j > i:
            print(" ", end = "")
        else:
            print(j, end = "")
    print()

for i in range(1, 7):
    for j in range(1, 8 - i):
            print(j, end = "")
    print()

for i in range(1, 7):
    for j in range(6, 0, -1):
        if j > i:
            print(" ", end = "")
        else:
            print(j, end = "")
    print()

for i in range(1, 7):
    for j in range(6, 0, -1):
        if j > 7 - i:
            print(" ", end = "")
        else:
            print(j, end = "")
    print()

height = int(input('Enter height: '))
for i in range(1, height + 1):
    #for j in range(height - i):
    #    print(" ", end="")
    #for j in range(i):
    #    print("*",end="")
    #print()
    print(" " * (height - i), end = '')
    print('*' * i)

