# append: adds items into the list one by one - one item at a time
#syntax: append(item). 

name_list = []
again = 'y'
#add some names into the list - adds it to the end of list
while again == 'y':
    name = input('enter the name:')
    name_list.append(name)
    #to add another name into the list
    print('do you want to add more name')
    again = input('y = yes, anything else = no:')
    #print()
#display the names that were added
print('here are the names:')
print(name_list)
