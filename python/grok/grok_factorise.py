def factorise(limit):
    for i in range(1, limit + 1):
        for j in range(1, limit + 1):
            if i % j == 0:
                print('* ', end='')
            else:
                print('- ', end='')
        print()

def main():
    limit = int(input('Maximum number to factorise: '))
    factorise(limit)

main()
