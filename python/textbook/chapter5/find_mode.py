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