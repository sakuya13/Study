### this code counts the number of vowels in a dstring using the for loop

string = input('enter a string:')
tag = 0
for count in range(len(string)):
    if string[count] in "aeiou":
      tag +=1
print(tag)
      
