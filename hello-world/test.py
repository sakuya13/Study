print('a\b')
print('a\bb')

def main():
    not_integer = True
    while not_integer:
        integer = input('enter:')
        int_list = []
        if integer.isdigit():
            int_list.append(int(integer))
        else:
            not_integer = False
        print('average:', )

def main():
    not_integer = True
    while not_integer:
        integer = input('enter: ')
        if integer.isdigit():
            n = int(integer)
            if is_fib(n):
                print('is fib')
            else:
                print('out of range')
            not_integer = False

