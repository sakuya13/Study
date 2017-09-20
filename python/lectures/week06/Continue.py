
# bob is the control variable
bob = True

# count gives an escape parameter
count = 0

while bob:

    
    count += 1# maintain the count
    
    if count == 5:# miss out printing 5
        continue
    
    print(count)# print out the current loop cycle value
    
    if count == 10:# leave loop at 10
        break
    
    if count >= 100:# enter this if loop if reaches 100
        bob = False # trigger the loop breakout 

    
   
print('End')# outside the loop 
