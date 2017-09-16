# Sort in increasing order

def main():
    num = list(input("Enter some numbers: "))
    intNum = [int(x) for x in num]
    n = len(intNum)
    print(displaySortedNumber(intNum, n))

def displaySortedNumber(intNum, n):
    for i in range(1, n):
        v = intNum[i]
        j = i - 1
        while j >= 0 and v < intNum[j]:
            intNum[j + 1] = intNum[j]
            j -= 1
        intNum[j + 1] = v
    return intNum

main()


