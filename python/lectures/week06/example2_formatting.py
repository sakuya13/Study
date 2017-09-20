#specifying a minimum field width - is the minimum number of spaces that
#should be used to display a value
'''
my_value = 1.123456789
print('the value is:%6.2f' % my_value)
'''
# 6 specifies the number of spaces reserved on the screen for the value.
#the num is shorter than the field width. So this will be right justified.
#if the value is too large to fit in the specified field width, the field
#is automatically enlarged to accomodate it.
'''
check_value = 112345.12345678
print('the long value:%6.2f' % check_value)
'''
num1 = 127.899
num2 = 3465.148
num3 = 3.776
num4 = 264.821
num5 = 88.081
num6 = 799.999
print('%7.2f' % num1)
print('%7.2f' % num2)
print('%7.2f' % num3)
print('%7.2f' % num4)
print('%7.2f' % num5)
print('%-7.2f' % num5) # left justified
print('%-7.2f' % num6)

