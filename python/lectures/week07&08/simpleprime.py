for num in range(1,10):  #to iterate between 1 to 20
   for i in range(2,num): #to iterate on the factors of the number
      print(i, num)
      if num%i == 0:      #to determine the first factor
         print (num, 'is not prime')
         break 
   else:                
      print (num, 'is a prime number')

