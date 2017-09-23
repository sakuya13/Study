def main():
    num1 = int(input('Enter first integer: '))
    num2 = int(input('Enter second integer: '))
    if num1 <= num2:
        print(sum_between(num1, num2))
    else:
        print(sum_between(num2, num1))

def sum_between(j, k):
    sums = 0
    for i in range(j, k + 1):
        sums += i
    return sums

main()