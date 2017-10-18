# section C q1 - example on sample exam
def sqsum(n):
    total = 0
    for i in range(1, n+1):
        total += i ** 2
    return total

def main():
    x = int(input('enter an integer:'))
    print(sqsum(x))

main()
