## to calculate if a number is prime or not
"""
for num in range(1,20):  #to iterate between 1 to 20
   for i in range(2,num): #to iterate on the factors of the number
      if num%i == 0:      #to determine the first factor
         print(num, 'is not prime')
         break 
   else:                
      print (num, 'is prime')
print ("Good bye!")
      
"""
num = 1
while(num < 20):
     i = 2
     while(i <= (num/i)):
          if not(num % i):
             print(num, 'is not prime')
             break
          i = i + 1
     if (i > num/i) :
               print (num, " is prime")
     num = num + 1

print ("Good bye!")


