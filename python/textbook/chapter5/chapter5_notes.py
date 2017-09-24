'''
chapter5 
5.1 list
'''
# mutators return None.
alist = [4, 2, 1, 3]
l1 = alist.sort()
l2 = alist.append()
l3 = alist.insert()
l4 = alist.extend()

# copying a list: don't ust assignment.
first = [1, 2, 3]
second = first # alias side effect: change second will also change first.
third = first[:] # eliminate the side effect.

# differenciate object identity and structural equivalence: '==' or 'is'?
lst1 = [1, 2, 3]
lst2 = lst1
lst3 = lst1[:]
lst2 == lst1 # returns true.
lst2 is lst1 # returns true.
lst3 is lst1 # returns false.

'''
5.1 exercises
1a: 7
1b: 7
1c: 3
1d: [5, 3]
1e: False
1f: [5, 3, 7, 2, 10, 5]
1g: (5, 3, 7)

2a: data[0] = -5
2b: data.append(10)
2c: data.insert(2, 22)
2d: data.pop(1)
2e: data.extend(newdata)
2f: data.index(7)
2g: data.sort()

3 
4 see below.
5 see below.
6 see below.
'''
#4
def main():
    data = [1, 2, 3, 4, 5, 6, 7]
    print(accumulate(data))

def accumulate(lst):
    sums = 0
    for i in lst:
        sums += i
    return sums

main()

#5
def main():
    data = [1, 0, 3, 4, 0, 6, 0]
    print(nonzero(data))
    
def nonzero(lst):
    result = []
    for i in lst:
        if i != 0:
            result.append(i)
    return result

main()

#6
def main():
    data = [-1.1, 0, 3, -4, 0, 6, -7]
    print(lstabs(data))

def lstabs(lst):
    result = []
    for i in lst:
        result.append(absolute(i))
    return result

def absolute(i):
    if i < 0:
        i = -i
    return i

main()

'''
5.2 function
'''
# boolean function.
def odd(x):
    return x % 2 == 1
print(odd(2))
print(odd(3))

'''
5.2 exercises
'''
# 2 & 3
def even(x):
    return x % 2 == 0
print(even(1))
print(even(2))

# 4
def main():
    num1 = int(input('Enter first integer: '))
    num2 = int(input('Enter second integer: '))
    if num1 <= num2:
        print(sum_between(num1, num2))
    else:
        print(sum_between(num2, num1))

def sum_between(j, k):
    sums = 0
    for i in range(j, k + 1):
        sums += i
    return sums

main()

'''
5.4 dictionary
'''
# 5.4.2 adding keys and values
info = {'name': 'Sandy', 'occupation': 'manager'}
info['age'] = 13
info['name'] = 'Kate'

# 5.4.3 accessing values
info.values
info.get('job', None) # if 'job' exists, return its value, else, return default
# value None.
# alternative way to check whether a key exists.
'job' in info


# 5.4.4. removing keys
info.pop('occupation', None) # works the same as accessing values.

# 5.4.5 traversing
info.items() # returns a list of tuple.
# alternatively (with sorting of keys)
info = {'name': 'Sandy', 'occupation': 'manager'}
keys_list = sorted(info.keys())
for key in keys_list:
    print(key, info[key])

# 5.4.7 find the mode.
def find_mode(lst):
    dictionary = {}
    for item in lst:
        if dictionary.get(item, None) is None:
            dictionary[item] = 1
        else:
            dictionary[item] += 1
    # alternatively
#    for item in lst:
#        if item in dictionary:
#            dictionary[item] += 1
#        else:
#            dictionary[item] = 1
    maxvalue = 0
    for value in dictionary.values():
        if value > maxvalue:
            maxvalue = value
    for key in dictionary:
        if dictionary[key] == maxvalue:
            return key, dictionary[key]

words = ['apple', 'apple', 'tree', 'fat', 'cat', 'cat', 'cat']
print(find_mode(words))

'''
5.4 exercise
2a: 20
2b: None
2c: 2
2d: ['b', 'a']
2e: [20, 35]
2f: 20
2g: {'a': 35}
'''
# 3a
data = {'b': 20, 'a': 35}
data['b'] = -data['b']
# 3b
data['c'] = 40
# 3c
if 'b' in data:
    data['b'] = None
# 3d
data = {'b': 20, 'a': 35}
for key in sorted(data.keys()):
    print(key, end=' ')
print()
