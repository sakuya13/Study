# example using strings and formatting

s = 'xylophone'
# these two print statements mean the same
print('%s' % s)

print('%.5s' % s) # 5 charaters alone 
 
print('%.*s' % (7, s)) # 7 characters in the string
print('%.*s' % (2, s)) # two characters in the string
print('%10.5s' % s)
print('%8.3s' %s)
print('%-8.2s' %s)

###exponent
print('%10.3e' % (2000.345))
print('%10.2E' % (3456.234))




