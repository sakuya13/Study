'''
GROK FUNCTION SECTION
CHAPTER 6 NOTES on FUNCTION
'''
# print the number of digits in a number
def num_digits(n):
    s = str(abs(n))
    print(len(s) - ('.' in s)) # eliminate the decimal point

def main():
    v = float(input('enter a value: '))
    num_digits(v)

main()

# fibonacci number
def f(n):
    a, b = 0, 1
    for i in range(n):
        a, b = b, a + b
        print(a, end=" ")

f(10)
# it is possible to have a function with no arguments, 
# in which case the function definition will have empty parentheses,
# and any function calls will similarly have empty parentheses
def error_code():
    return -1
# call function using keywords
def eat(cat, food):
    return cat + ' eat ' + food

print(eat(cat='meow', food='fish'))

# some funny formats
print("strings: {:s}".format("9743"))
print("binary number: {:b}".format(9743))
print("integer base 10: {:d}".format(9743))
# Characters
print("Call me on my {:c}".format(9743))  # yes, it's a telephone
# Try printing Ӝ — it's a Cyrillic capital Zhe with diaeresis 
print("Call me on my {:c}".format(1244))
# (Hint: its Unicode "code point" number is 1244) 
print("Call me on my {:c}".format(3061))
# — or this Tamil year sign: ௵ (number 3061).

# indexing format
print("{0} {0} It's off to work we go".format("Hi Ho!"))
print("{1} {0} It's off to work we go".format("Hi Ho!", "fat!"))

# format using key words
print("""{t1} and {t2} Agreed to have a battle; For {t1} said {t2}
Had spoiled his nice new rattle.""".format(t1="Tweedledum", t2="Tweedledee"))

# some comparisions bewtween old and new formatting styles
pi = 3.1415926
# Old style
print('%-6.2f' % pi)  # pad on the right
print('%6.2f' % pi)   # pad on the left
# New style
print('{:<6.2f}'.format(pi))  # pad on the right
print('{:6.2f}'.format(pi))   # pad on the left

# Old style
print("%(t1)s and %(t2)s agreed to have a battle" % {'t1': "Tweedledum", 't2': "Tweedledee"})
# New style
print("{t1} and {t2} agreed to have a battle".format(t1="Tweedledum", t2="Tweededee"))

# aarhhhh
def main():
    input_string = input('What did you buy: ')
    string_list = input_string.split()
    quantity = int(string_list[0])
    cost_str = string_list[len(string_list)-1][1:]
    cost_float = float(cost_str[:len(cost_str)-1])
    print(calculation(cost_float, quantity))

def calculation(cost, quantity):
    return '${:.2f}'.format(cost / quantity)

main()

'''
SET
'''
# note that True is a number subset
my_set={"a", "b", "c", 1}
print("a" in my_set)
print(True in my_set)

# removing duplicate elements
my_sequence = "hello"
my_set = set(my_sequence)
print(my_set)

# operators: '|' means 'joint', '&' means 'in both'
my_set1 = {2, 3, 4}
my_set2 = {2, 5}
print("my_set1-my_set2", my_set1 - my_set2)
print("my_set2-my_set1", my_set2 - my_set1)
print("Union: my_set2|my_set1", my_set2 | my_set1)
print("Intersection: my_set2 & my_set1", my_set2 & my_set1)

# set is mutable
my_set = {"a", 1, ("bob", 45)}
my_set.add(("Joe", 50))
print(my_set)
my_set.remove(("bob", 45))
print(my_set)

# set has no index (each time generates in different orders), bus has length
my_set = {"a", 1, ("bob", 45)}
print(len(my_set))

# count the joint friend
def mutual_friends(list1, list2):
    return len(set(list1) & set(list2))

def main():
    list1 = input('list1 = ')
    list2 = input('list2 = ')
    print(mutual_friends(list1, list2))

main()

'''
ADVANCED FUNCTIONS
'''
# return None as default value
def maxlist(numlist):
    if numlist:
        maxnum = numlist[0]
        for num in numlist[1:]:
            if num > maxnum:
                maxnum = num
        return maxnum

print(maxlist([]))

def mymax(numlist):
    if numlist:
        return max(numlist)

# return multiple values using tuple
def minmax_list(intlist):
    # CASE 1: intlist is empty
    if not intlist:
        return None, None  # tuple not list
    # CASE 2: intlist has at least one element
    else:
        minval = maxval = intlist[0]
        for i in intlist[1:]:
            if i > maxval:
                maxval = i
            if i < minval:
                minval = i
    return minval, maxval  # tuple not list

# little test
def maxby(intlist):
    if not intlist:
        return None, None
    lst_len = len(intlist)
    if lst_len == 1:
        return intlist[0], None
    else:
        intlist.sort()
        return intlist[lst_len-1], intlist[lst_len-1] - intlist[lst_len-2]

print(maxby([]))

# lazy evaluation (multiple return points)
def poslist2(numlist):
    for num in numlist:
        if num <= 0:
            return False
    return True
    
print(poslist2([0, -1, 3, 5]))

# little practice
def issorted(numlist):
    if not numlist:
        return True
    for i in range(1, len(numlist)):
        if numlist[i] < numlist[i-1]:
            return False
    return True

# last evaluation exercise
def basenum(num, base):
    '''test if all digits in num is strictly smaller than base'''
    if type(num) != int or type(base) != int:
        return False
    if num < 0 or base <= 0 or base > 10:
        return False
    num_string = str(num)
    for num in num_string:
        if int(num) >= base:
            return False
    return True
