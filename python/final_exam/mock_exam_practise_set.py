'''mock exam 1'''

# Q1
# TODO:pick up the keys and return a sorted list of the keys
sorted({'dogs': ['Anne'], 'ducks': ['Mathew']})[-1]
# the 0 and 1s before the : is the index of arguments in the format()
# here 0 points to 3.141592653 and 1 points to 22/7
"pi = {0:_>10.5f} != {1:.5f}".format(3.141592653, 22/7)
"pi = {0:10.5f} != {1:.5f} {0}".format(3.141592653, 22/7)
# try to return the value of the key, if no such key found, return tue default
# arguement, which is 'not found' here
{'name':'kev','Age':25,'ID':2314,'pay': 24.99}.pop('gender', 'not found')

# Q6TODO:
'''syntax and runtime error is the exact points in the code that trigger
error, logic error often locates at the points where it doesn't trigger any
error, but it eventually leads to the wrong output of the code'''

def same_kv(dic):
    out = []  # logic error
    for key, val in d.items():
        if key = val:  # syntax error
            out[val] = key  # runtime error
    print out  # logic error
# revise it to:
def same_kv(dic):
    out = {}
    for key, val in d.items():
        if key == val:
            out[key] = val
    return out

# Q9
def min_sum (list_of_list):
    min_list = []
    for lst in list_of_list:
        sums = 0
        for i in lst:
            sums += i
        min_list.append(sums)
    return min(min_list)

print(min_sum([[1, 4, 0, 2], [2, 5, 1, 3], [3, 6, 2, 4]]))

# Q10
def multipal(word, n=None):
    if word == '':
        return False
    if word != word[::-1]:
        return False
    elif n is None:
        n = 2
        while n < len(word):
            pattern_length = len(word) // n
            pattern = word[:pattern_length]
            n += 1
            if pattern * n == word:
                return True
        return False
    elif n is not None and n >= 2:
        pattern_length = len(word) // n
        pattern = word[:pattern_length]
        return pattern * n == word
    else:
        return False

def debug():
    print(multipal('aaaa', 4))
    print(multipal('abababa', 3))
    print(multipal('abccba'))  # when not a multi-palindrome

    print(multipal_ver2('aaaa', 4))
    print(multipal_ver2('abababa', 3))
    print(multipal_ver2('abccba'))  # when not a multi-palindrome


def multipal_ver2(word, n=None):
    if word == '':
        return False
    if word != word[::-1]:
        return False
    if n is None:
        test_range = range(2, len(word))
    else:
        test_range = [n]
    for k in test_range:
        pattern_length = len(word) // k
        pattern = word[:pattern_length]
        if pattern * k == word:
            return True
    return False

debug()

'''practice set01'''
# 2(a)
a = 1
b = 2
c = 3.0
d = 0
a + b / c  # 1.6666666666666665  # by default, 16 positions after the floating point
bool(d and not b or a)
bool((d and not b) or a)
bool(d and not (b or a))

# 3(d)
s = 'internationalization'
s[25]  # IndexError
s[:25]  # full string

# 4
print("{} was a racehorse, {} was one too".format(11, 22))
print("One day {1} won a race, and {0} won one too".format(11, 22))
print("One day {h1} won a race, and {h2} won one too".format(h1=11, h2=22))
print("pi = {0:10.5f} != {1:.5f}".format(3.141592653, 22/7))

# the 0 and 1s before the : is the index of arguments in the format()
# here 0 points to 3.141592653 and 1 points to 22/7
print("pi = {0:_>10.5f} != {1:.5f}".format(3.141592653, 22/7))
print("pi = {0:10.5f} != {1:.5f} {0}".format(3.141592653, 22/7))
print("pi = {0:10.5f} != {1:.5f} {1}".format(3.141592653, 22/7))


'''practice set03'''
# Q1
d={"R":0,"G":255,"B":0,"other":{"opacity":0.6}}
d['H']  # KeyError
d[["H","S","L"]]=[120,98,5]  # TODO:TypeError: unhashable type:list, which is
                             # mutable. only immutable datatype is hashable
d["R","B","G"]  # KeyError

# Q3
def mutate(x, y):
    x = x + '--The End--'
    y.append('The End')
    print(x)
    print(y)

mystr = 'It was a dark and stormy night.'
mylist = mystr.split()
mylist2 = mylist  # mylist is changed
mutate(mystr, mylist2)  # mylist is changed
print(mystr)
print(mylist)  # mylist is changed

# QP1
def freq_letter(string):
    tally = {}
    for char in string:
        if char in tally:
            tally[char] += 1
        else:
            tally[char] = 1
    tally_tup = sorted(tally.items())
    rank = sorted(tally_tup, key=lambda k: k[1], reverse=True)
    return rank[0]

def debug():
    print(freq_letter('aardvark'))
    print(freq_letter('wooloomooloo'))
    print(freq_letter('abacuses'))

debug()

# QP2
def descend(dict):
    rank = sorted(dict.items(), key=lambda k: k[1], reverse=True)
    for item in rank:
        print(item[0])

fruit_prices={"apple":0.5,"banana":19,"durian":7}
descend(fruit_prices)

# Q, P3 TODO: set.update(): update the set with the union of itself and others
def make_catalogue(items, old_cat=None):
    itemset = set(items)
    if isinstance(old_cat, set):
        old_cat.update(itemset)
        # return old_cat.copy()
        return set(old_cat)
    return itemset
    # if old_cat is not None :
    #     return   # Union the two sets
    # else:
    #     return set(items)
def debug():
    print(make_catalogue(['spam', 'spam', 'eggs']))
    print(make_catalogue(['spam','spam','eggs'], old_cat={'eggs','milk'}))
    my_cat = {'spam', 'socks'}
    print(make_catalogue(['toothbrush', 'socks'], my_cat))
    print(my_cat)
debug()

'''practice set04'''
# Q1
mylist=[3,["green","eggs"],True,"computing"]
mylist[3:]  # will return a list

# TODO: Q6: use type() or isinstance()?
def num(obj):
    return type(obj) is int or type(obj) is float

def num2(obj):
    return isinstance(obj, int) or isinstance(obj, float)

print(num(4.6))
print(num('4.6'))
print(num('4'))
print(num(4))

print(num2(4.6))
print(num2('4.6'))
print(num2('4'))
print(num2(4))

#Q7
def sqsum(n):
    sums = 0
    for i in range(1, n+1):
        sums += i**2
    return sums

print(sqsum(3))

'''practice set05'''
# Q1 TODO: modular 0 % 4, 3 % 4, 4 % 4, 5 % 4
# Q2 TODO: local and global variables
def foo(x, y):
    global a
    a = 42
    x, y = y, x
    b = 17
    c = 100
    print(a, b, x, y)

a, b, x, y = 1, 2, 3, 4
foo(17, 4)
print(a, b, x, y)

# Q4 by default, sqrt() return a float
from math import sqrt
def hypotenuse(a, b):
    return sqrt(a ** 2 + b ** 2)

print(hypotenuse(3, 4))

# Q5 default parameter can be a function!
def extremum(numlist, comp=max):
    return comp(numlist)

numlist = [1, 4, 0, -1, 6]
print(extremum(numlist))
print(extremum(numlist, comp=max))
print(extremum(numlist, comp=min))

# Q6 TODO:
from collections import defaultdict
def hapax(text):
    t_list = text.split()
    d = defaultdict(int)  # the parameter here is the type for value
    for word in t_list:
        d[word] += 1
    sorted_d = sorted(d)
    freq_1_word = [key for key in sorted_d if d[key] == 1]
    return freq_1_word

print(hapax('a b c a'))
print(hapax('c ba a a'))

# an example with the list as the value type
from collections import defaultdict
s = [('yellow', 1), ('blue', 2), ('yellow', 3), ('blue', 4), ('red', 1)]
d = defaultdict(list)
for k, v in s:
    d[k].append(v)
print(d)

# Note also that the type we provide is only the default value for a new key,
# and we are not constrained to use only that type for all {key: value} pairs:
from collections import defaultdict
d = defaultdict(int, {'a': 2})
d['b'] = 'hah!'
print(d)
