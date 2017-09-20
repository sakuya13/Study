"""
The following example illustrates the combination of an else statement
with a for statement that searches for prime numbers from 1 through 20.And prints
whether the number is prime. It also calculates and prints the factors if the
number is not prime
"""

for num in range(1,20):  #to iterate between 1 to 20
   for i in range(2,num): #to iterate on the factors of the number
      #print(i,num)
      if num%i == 0:      #to determine the first factor
         j=num/i          #to calculate the second factor
         print ('%d equals %d * %d' % (num,i,j))
         break 
   else:                
         print (num, 'is a prime number')

