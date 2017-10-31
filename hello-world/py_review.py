
'''
general
'''
# returns a list of iterables (keys in this case):
sorted({'dogs': ['Anne'], 'ducks': ['Mathew']})

# sort or max with the value
d={'dogs':['P'],'ducks':['M']}
print(sorted(d, key=lambda k:d[k]))
# if you want to return the key and the value
print(sorted(d.items(), key=lambda k: k[1]))

# this type of for loop can be replaced by list comprehension
tally = {'2000': 21, '2001':21, '2002':20, '2003':19}
# max_list = []
# tally_max = max(tally, key=lambda k: tally[k])
# for item in tally:
#     if tally[item] == tally[tally_max]:
#         max_list.append(item)
# print(', '.join(max_list))

# better use list comprehension:
tally_max = max(tally, key=lambda k: tally[k])
m_lst = [item for item in tally if tally[item] == tally[tally_max]]
print(', '.join(m_lst))

'''
week02
1. variable naming: must not start with a number, but can contain numbers in the
rest part of the name.

2. With two exceptions, operations of equal precedence are left associative,
so they are evaluated from left to right. Exponentiation (**) and assignment (=)
are right associative.

3. the escape sequeces: \b, \n, \t, \\, \', \"
'''
a = ''  # a is string
chr(ord('a')+3) #  shifting in ASCII
-3**2
-(3)**2  #  lecture note is wrong
(-3)**2

# only exponentiation and assignmment are right associative
2 ** 3 ** 2  # 512
(2 ** 3) ** 2 # 64

# float or int?
x//12.0
3//2*5.0
3/2*5

# differences? how to call the functions?
import math
from math import pi, sqrt
from math import *

# result?
int(3.77)
int('3.77')
round(3.77)

# multi-line paragraphs
print('''abcabc
abcabc''')
# actually means:
print('abcabc\nbcabc')

# multiply str
print(' '*10 + 'abc')

'''
week03
1. precedence of  logical operators: 'not' is higher than 'and', 'or' (p.41)
'''
a = False  #  b = true or false
a and b  # only need to evaluate a
a = True
a or b  # only need to evaluate a

'''
week04
1. string is an immutable data structure.
2. string methods s.split()
'''
# what's the result?
s = 'abcdef'
print(s[2::-1])
print(s[2:0:-1])
print(s[-4:-6:-1])
print(s[0:2:-1])  # is it gonna return error?

# string methods
s.center(width)  # with is the length of the intended string
s = 'hi'
s.center(11)

s.count(sub[, start[, end]])
s = 'aabbbccccc'
s.count('c', 0, 6)

s.lower()
s.upper()
s.endswith(sub)
s.startswith(sub)
s.isalpha()
s.isdigit()

s.join(sequence)  #', '.join(list), s is the separator string
print(', '.join(['abcd', 'efgh']))  # here the separator is , and whitespace

s.find(sub[, start[, end]])  # return the lowest index, can't find then return -1
quote = 'Do small things with great love'
# Substring is searched in 'hings with great love'
print(quote.find('small things', 10))
# Substring is searched in 'hings with great lov'
print(quote.find('o small ', 10, -1))

s.replace(old, new[, count])  # only the first count occurrences are replaced
s = 'Hi There'
s.replace('i', 'o')
song = 'let it be, let it be, let it be'
# maximum of 0 substring is replaced
# returns copy of the original string
print(song.replace('let', 'so', 0))
print(song.replace('let', 'so', 2))

s.split([sep])  # sep is the dilimiter, by default use whitespace as dilimiter,
# returns a list.
s.strip([aString])  # by default remove the leading and trailing whitespace

'''
week05
'''
# for loop print without newline
for character in 'Hi there!':
    print(character, end=' ')

# step value in range
list(range(1, 6, 2))

# enumerate
text = 'simple'
for index, character in enumerate(text):
    print(index, character)
print('end')
# mid-term test: loop control statements
for index, number in enumerate([1, 2, 3, 4, 5, 6, 7, 8, 9]):
    if index == 5:
        continue
    if index == 8:
        break
    print(number, end=' ')
print('end')

# nested loop: find prime number
for num in range(1,20):
    for i in range(2, num):
        if num % i == 0:
            j = num / i
            print('%d equals %d * %d' % (num, j, i))
            break
    else:
        print(num, 'is a prime number.')
# alternative way
for num in range(1,20):
    loop_done = True
    for i in range(2, num):
        if num % i == 0:
            j = num / i
            print('%d equals %d * %d' % (num, j, i))
            loop_done = False
            break
    if loop_done:
        print(num, 'is a prime number.')

'''
formating old ver.
'''
# '%<format string>' % (<datum-1>, ..., <datum-n>)
print('%6s' % 'four')  # right justified
print('%-6s' % 'four')  # left justified

for exponent in range(7, 11):
    print('%-3d%12d' % (exponent, 10 ** exponent))

# formatting float: '%<field width(precision included)>.<precision>f' % (<datums>)
print('%6.3f' % 3.14)
print(str(100.00))  # by default, precision to 0.1

'''
week06 formatting continue
'''
'''old ver'''
# formatting won't round
amount = 24.325
print('%.2f' % amount)
# guess it
print('%5s' % 'tropical')
print('%.5s' % 'tropical')
print('%5s' % 'trop')
print('%-5s' % 'trop')

x=1
y=2
z=3
print('%6d\n%6d\n%6d' % (x, y, z))
print('%-6d\n%-6d\n%-6d' % (x, y, z))

s = 'mysterious'
print('%.*s' % (7, s))  # 7 characters in the string
print('%.*s' % (2, s))

# exponent
print('%10.3e' % 2000.345)
print('%10.2E' % 2000.345)

# negative numbers(or showing the sign)
print('%+d' % 60)  # positive num sign inside the format string, negative is not
print('%d' % -60)

'''
new formatting
'''
print('{:_<10}'.format('test'))
print('{:_^10}'.format('test'))
print('{:_>10}'.format('test'))
print('{:*<10}'.format('test'))
print('{:f}'.format(3.141592653589793))  # by default, precision to 0.000000
print('{:10s}'.format('this is')) #default left justified

print('{:+d}'.format(60))
print('{:d}'.format(-60))

data = [4, 8, 15, 16, 23, 42, 34, 65, 12]
print('{d[4]} {d[5]}'.format(d=data))

from datetime import datetime
print('{:%Y-%m-%d %H:%M}'.format(datetime(2016, 2, 10, 4, 30)))


