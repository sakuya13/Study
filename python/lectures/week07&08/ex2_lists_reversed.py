#example to use the reverse method
listofvalues =[10,15,20,40]
for i in reversed(listofvalues):
       #print (i)
       print('{:#^10d}'.format(i))

print("####")

#Exampe to sort items in a list- sort method
listofvalues =[10,25,20,40, 11]
for i in sorted(listofvalues):
      print (i)
print("####")

# another way of using sort - example

listofvalues =[10,25,20,40, 11]
listofvalues.sort()
print(listofvalues)
for i in listofvalues:
       print(i)
