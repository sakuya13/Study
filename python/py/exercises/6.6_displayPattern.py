def displayPattern(n):
    for i in range(1, n + 1):
        for j in range(n, 0, -1):
            if j > i:
                print(format(" ", "3s"), end="")
            else:
                print(format(j, "3d"), end="")
        print()

def main():
    n = int(input("Enter a number: "))
    displayPattern(n)

main()

