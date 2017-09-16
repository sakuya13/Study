def getPentagonalNumber(n):
    p = n * (3 * n - 1) / 2
    return p

def main():
    NUMBER_OF_PENTAGONAL_NUMBER = 100
    for i in range(1, NUMBER_OF_PENTAGONAL_NUMBER + 1):
        print(format(getPentagonalNumber(i), '5.0f'), end = " ")
        if i % 10 == 0:
            print()

main()

