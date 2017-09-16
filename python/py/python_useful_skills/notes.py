#b wont change.
a = 100
b = a
a += 1

#in list, it works different, b will change
a = [2, 3, 7, 9]
b = a
a.append(12)


#the way to use get() by assigning it a default value
dict1 = {'a': 1, 'b': 2, 'c': 3}
print(dict1.get('a'))
print(dict1.get('d', 0))
print(dict1.get('a', 0))
d_items = dict1.items()
print(d_items)
#all dictionary fucntions return iteratives but not represented as list