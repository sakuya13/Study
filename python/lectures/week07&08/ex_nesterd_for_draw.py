symbol = '#'
number = int(input ('enter a number:'))
s = ""
for x in range(1, number):
    #s = "" 
    for y in range(x): 
        s += symbol
    print (s)
