def main():
    f = open('sales.txt', 'r')

    for i in f:
        a = float(i)
        print(format(a, '0.2f'))

main()
