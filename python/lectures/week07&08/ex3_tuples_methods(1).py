##length

tuple1, tuple2 = (123, 'xyz', 'zara'), (456, 'abc')

print ("First tuple length : ", len(tuple1))
print ("Second tuple length : ", len(tuple2))

## max amd min
tuple1, tuple2 = ('zar', 'xyz', 'zara', 'abc'), (100, 500, 20)

print ("Max value element : ", max(tuple1))
print ("Max value element : ", max(tuple2))
print ("Min value element : ", min(tuple1))
print ("Min value element : ", min(tuple2))

#convert a list of items into tuples

Listofitems = [23, 'years', 'dogs', 'cats'];
toaTuple = tuple(Listofitems)

print ("Tuple elements : ", toaTuple)
