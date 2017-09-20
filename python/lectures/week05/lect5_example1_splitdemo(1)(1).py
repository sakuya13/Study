# this is an example for the split method
# You can access and work with items in a list
#author: Antonette
#date: 21/08/2016
"""

s = ' 1 2 3 4'
listofitems = s.split()

# creates a list of items
print(listofitems)
# this following statement simply concatenates the items in the list. why?
x = listofitems[0] + listofitems[1] + listofitems[2]
print(x)

# this statement does some calculation with individual items in the list
x = int (listofitems[0]) + int(listofitems[1]) + int(listofitems[2])
print (x)


###anothre interesting way - use a tuple
(a, b, c,d) = s.split()
print(a)
print(b)
print(c)
print(d)
sum = int(a) + int(b) + int(c) + int(d)
print (sum)

"""
s = input('enter a string:')
text = s.split()
print(text)
if text[0] == text[1] and text[1] == text[2]:
    print('yes, the words are the same')
else:
    print('no, the words are different')

