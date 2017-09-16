from math import pi
radius, length \
    = eval(input("Enter the radius and length of a cylinder: "))
area = pi * radius ** 2
volume = area * length
print("The area is %0.2f." % area)
print("The volume is %0.1f." % volume)
