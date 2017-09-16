#def check_move(column, row):
#    column_list = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
#    row_list = [1, 2, 3, 4, 5, 6, 7, 8]
#    if column in column_list and row in row_list:
#        return 'The piece is moved to ' + column + str(row) + '.'
#    else:
#        return 'The position is not valid.'

#print(check_move('B', 4))

"""
a list
find the biggest number in the list
you can make a assumption: there's always a number left
"""
#maximum = float('-inf')
#for i in num_list:
#    if i > maximum:
#        maximum = i
#print(maximum)

num_str = input('Enter some integers (seperate with whitespaces): ')
num_list = [int(j) for j in num_str.split()]

def find_max(l):
    if num_list == []:
        return 'Empty list'
    maximum = num_list[0]
    for i in num_list[1:]:
        if i > maximum:
            maximum = i
    return maximum

print(find_max(num_list))
