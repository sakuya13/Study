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

