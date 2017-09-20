#some more on formatting
from datetime import datetime
#old

print('%.5s' % ('tropical'))
print('%5s' % ('tropical'))
print('%5s' % ('trop'))


#New

print('{:.5}'.format('tropical'))
print('{:5s}'. format('tropical'))


# example that uses date and time method
print('{:%Y-%m-%d %H:%M}'.format(datetime(2016, 2, 10, 4, 30)))

#get item
#example 1
data = [4, 8, 15, 16, 23, 42]

print('{d[4]} {d[5]}'.format(d=data))

#example2

student_name = {'first': 'Tedd', 'last': 'Hermann'}

print('{p[first]} {p[last]}'.format(p=student_name))

#or another way of writing this

data = {'first': 'Tedd', 'last': 'Hermann!'}

#Old
print('%(first)s %(last)s' % data)
#New
print('{first} {last}'.format(**data))

#Signed numbers
#By default only negative numbers are prefixed with a sign. This can be changed of course.

#Old
print('%+d' % (60))
#New
print('{:+d}'.format(60))


#Old
print('%d' % ((-40)))
#New
print('{:d}'.format((-40)))

