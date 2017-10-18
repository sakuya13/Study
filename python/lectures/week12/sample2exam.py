def mutate(x, y):
    x = x + "--The End--"
    y.append("The End")
    print(x)
    print(y)
mystr = "It was a dark and stormy night."
mylist = mystr.split()
mylist2 = mylist
mutate(mystr, mylist2)
print(mystr)
print(mylist)
