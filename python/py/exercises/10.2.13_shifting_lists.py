SHIFT_RANGE = 3


def main():
    s = input('Enter integer: ')
    lst = s.split()
#    for i in range(10):
#        lst.append(input('enter numbers: '))
    lst1 = [int(x) for x in lst]
    shift(lst1)
    print(lst1)


def shift(lst):
    for j in range(SHIFT_RANGE):
        temp = lst[0]
        for i in range(1, len(lst)):
            lst[i - 1] = lst[i]
        lst[len(lst) - 1] = temp

main()
