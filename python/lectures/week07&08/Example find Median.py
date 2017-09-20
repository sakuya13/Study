listofnumbers = input ('enter a list of numbers:')
numbers = []
words = listofnumbers.split()
for word in words:
    numbers.append(float(word))print(numbers)

numbers.sort()
print(numbers)
midpoint = len(numbers) // 2
print("the median is", end=" ")
if len(numbers) % 2 == 1:
    print(numbers[midpoint])
else:
    print((numbers[midpoint] + numbers[midpoint -1]) /2)

# iterates in reverse 
listofvalues =[10,15,20,40]
for i in reversed(listofvalues):
    print (i, end=", ")
