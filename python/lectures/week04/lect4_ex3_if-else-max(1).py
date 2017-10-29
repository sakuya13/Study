#write a program to accepts two positive integers and print out the maximum
#and the minimum of the two input numbers

#import math

first = int(input('Enter the first number:'))
second = int(input('Enter the second number:'))
if first > second:
    maximum = first
    minimum = second
else:
    maximum = second
    minimum = first
print ('maximum:', maximum)
print ('minimum:', minimum)
