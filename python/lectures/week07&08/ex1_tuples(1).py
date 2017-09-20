#assessing items/values in a tuple
tup1 = ('physics', 'chemistry', 1997, 2000)
tup2 = (1, 2, 3, 4, 5, 6, 7 )
tup3 = "a", "b", "c", "d"
print ("tup1[0]: ", tup1[0])
print ("tup2[1:5]: ", tup2[1:5])
print(tup3)

list1 = "1 2 3"
(a, b, c) = list1.split()
print(a,b,c)


#updating values in a tuple - Tuples are immutable which means you
#cannot update or change the values of tuple elements. 
tup1 = (12, 34.56)
tup2 = ('abc', 'xyz')

# Following action is not valid for tuples
# So let's create a new tuple as follows
#so, tup1[0] = 100 will give you an error
tup3 = tup1 + tup2
print (tup3)


#deleting a value from a tuple - removing individual tuple elements is not
#possible. There is, of course, nothing wrong with putting together another
#tuple with the undesired elements discarded.

tup = ('physics', 'chemistry', 1997, 2000)

print (tup)
del tup;
print ("After deleting tup : ")
print (tup)
