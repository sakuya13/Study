'''
function
local and global variable
'''
# the variable pass, this one will trigger error because in the function bob, x
# is not defined
x = 10
def bob():
    x += 1
    print(x)
bob()
# use globle to retrive the variable outside the function
x = 10
def bob():
    global x
    x = x + 1
    print(x)
bob()
# pass the vaiable when calling the funciton(parameter)
x = 10
def bob(lunch):
    lunch += 2
    print(lunch)
bob(x)
