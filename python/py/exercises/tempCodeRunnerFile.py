height = int(input('Enter triangle height: '))
for i in range(height, 1, -1):
    print('*' * i, end='')
    print(" " * (height * 2 - 2 * i), end='')
    print('*' * i)
for i in range(1, height + 1):
    print('*' * i, end='')
    print(" " * (height * 2 - 2 * i), end='')
    print('*' * i)