# example to illustrate the index(). This simple program replaces an item in alist once it
#knows the index

food = ['pizza', 'burger', 'chips']
print('here are the list of items:')
print(food) 
item = input('which item would you like you change:')
#searching for item in list. If present, return the index (position)
if item not in food:
    print('the item is not in the list')
    
else:
    item_index = food.index(item)
    print(item_index)
#enter the new value to replace the old one
    new_item = input('enter the new item:')
    food[item_index] = new_item
    print(food)

