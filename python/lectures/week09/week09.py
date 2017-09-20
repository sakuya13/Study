'''
function
local and global variable
'''
# the variable pass, this one will trigger error because in the function bob, x
# is not defined
x = 10
def bob1():
    x += 1
    print(x)
bob1()
# use globle to retrive the variable outside the function
x = 10
def bob2():
    global x
    x = x + 1
    print(x)
bob2()
# pass the vaiable when calling the funciton(parameter)
x = 10
def bob3(lunch):
    lunch += 2
    print(lunch)
bob3(x)
