'''
binary and decimal.
'''
def binary_to_decimal(x):
    '''
    input binary number, output its decimal representation.
    '''
    decimal = 0
    a = 1
    for i in x:
        decimal += i * a
        a *= 2
    return decimal

def main():
    binary = input('Enter binary: ')
    bin_list = [int(x) for x in binary]
    print(binary_to_decimal(bin_list))

main()

# negation.
def decimal_to_binary(decimal):
    '''
    input decimal number output its binary representation.
    '''
    temp = []
    while decimal > 0:
        temp.append(decimal % 2)
        decimal //= 2
    bin_list = temp[::-1]
    bin_string = ''
    for item in bin_list:
        bin_string += str(item)
    return bin_string

def main():
    decimal = int(input('Enter decimal: '))
    print(decimal_to_binary(decimal))

main()