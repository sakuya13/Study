def sumDigits(n):
    sum = 0
    while n > 0:
        sum += n % 10
        n //= 10
    return sum

def main():
    n = int(input('Enter an integer: '))
    print('The sum of all its digits is:', sumDigits(n))

main()

