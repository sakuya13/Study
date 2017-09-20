# example to illustrate the remove(). 

food = ['pizza', 'burger', 'chips']
print(food) 
item = input('which item would you like to remove:')
if item not in food:
    print('the item is not in the list')
    
else:
    food.remove(item)
    print('here is the new list:')
    print(food)
