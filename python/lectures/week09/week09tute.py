'''
week09 tute
p.332 listing 10.5 call by sharing
'''
def m(number, numbers):
    number = 1001 # assigning the reference of value 1001 to variable number.
    numbers = 5555 # assigning the reference of value 5555 to variable number.
    #numbers[0] = 5555 # numbers as a list contains the reference of the list y,
    #which is mutable.

def main():
    x = 1 # note that x as an integer is immutable, though it is not the reason
    #why it is not changed here.
    y = [1, 2, 3]
    m(x, y)
    print('x is', x)
    print('y[0] is', y[0])
    #print(numbers)

main()

#TODO: important notes on default parameter in a function.
'''
listing 10.6 the default value lst is created only once, then it keeps
changing as it appends. so avoid using mutable data types as the default
parameter.
'''
def add1(x, lst = []): # defalut value keeps changing.
    # lst =z lst[:]  # this is one way to avoid it
    if x not in lst:
        lst.append(x)
    return lst

# revised version if want to create an empty list lst at whenever call.
def add2(x, lst=None):
    if lst is None: # use is but not ==.
        lst = []
    if x not in lst:
        lst.append(x)
    return lst

def call():
    list1 = add1(1)
    print(list1)

    list2 = add1(2)
    print(list2)

    list3 = add1(3, [11, 12, 13, 14])
    print(list3)

    list4 = add1(4)
    print(list4)

    list1 = add2(1)
    print(list1)

    list2 = add2(2)
    print(list2)

    list3 = add2(3, [11, 12, 13, 14])
    print(list3)

    list4 = add2(4)
    print(list4)
call()

'''
10.8 smart use of insert
'''
def reverse(lst):
    result = []
    for element in lst:
        result.insert(0, element)
        print(result)
    return result

list1 = [1, 2, 3, 4, 5]
list2 = reverse(list1)
print(list2)
