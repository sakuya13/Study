# show the different ways of using formatting - old and new version of python
#Examples for formatting using the format()

# using <, >, ^ and a filler
print('{:_<10}'.format('test'))
print('{:_^10}'.format('test'))
print('{:_>10}'.format('test'))
print('{:*>10}'.format('test'))

#Old formatting style
print('#######')
print('%-10s' % ('test'))
print('%10s' % ('this is a crazy example'))
print('%10s' % ('this is'))
print('%f' % (3.141592653589793))  # by default, precision to 0.000000
print('%.2f' % (3.141592653589793))
print('%10.2f' % (3.141592653589793))
print('%10d' % (2345)) # by default right justified
print('%10s' % ('test')) # by default right justified
print('%-10d' % (2345)) #left justified


#New formatting style
print('#######')
print('{:10}'.format('test')) # string is left aligned in python3
print('{:10}'.format(10.5)) # int and float are right aligned
print('{:10s}'.format('this is a crazy example'))
print('{:10s}'.format('this is'))
print('{:f}'.format(3.141592653589793))  # by default, precision to 0.000000
print('{:.2f}'.format(3.141592653589793))
print('{:10.2f}'.format(3.141592653589793))
print('{:10d}'.format(2345))
print('{:<10d}'.format(2345))
print('#####')

# check this out - with s formatting 
print('%10s' % ('this is')) # default right justified
print('%-10s' % ('this is'))
print('{:10s}'.format('this is')) #default left justified
print('{:>10s}'.format('this is'))
print('{:<10s}'.format('this is'))
print('{:^10s}'.format('this is'))

# padding in the new style - not that easy in the old style
print('-------')
print('{:#<10s}'.format('test'))
print('{:#>10s}'.format('test'))
print('{:#^10s}'.format('test'))

print('-------')
print('{:#<10.2f}'.format(234.898989898))
print('{:#>10.4f}'.format(234.55555566666666))
print('{:#^10d}'.format(22222222222222222))
print('{:#^10d}'.format(22))

