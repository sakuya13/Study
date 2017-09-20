#write a program to calcualte the area of a circle using input provided by user
import math
radius = int(input("enter the radius: "))
area = math.pi * radius ** 2 # mixed types so final result is float
print(area)
