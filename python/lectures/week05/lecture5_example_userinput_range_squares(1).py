#write a program in python that displays the numbers starting 1 through to
#a user's requiremrent and their squares in a table

print('this program displays a list of numbers starting at 1 and their squares')
end = int(input('please enter the max value you wish to go:'))
print ('Number\tSquare')
print('--------------')
for num in range (1, end + 1):
    square = num **2
    print(num, '\t', square)
