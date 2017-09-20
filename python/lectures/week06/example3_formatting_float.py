#formatting integers and strings : use %d and %s
'''
hours = 40
print('worked %d hours this week' % hours)
days = 7

# displaying multiple values
print('worked %d hours for %d days' % (hours, days))

# displaying strings
name = 'ringo'
print('this is my dog %s' %name)
'''
# this code prints set of salesman's name and units sold in two columns
sp1 = 'peter'
sp2 = 'paul'
sp3 = 'mary'
sp4 = 'james'
sp5 = 'john'
sp6 = 'jane'

unit1 = 1456.781
unit2 = 2890.552
unit3 = 946.778
unit4 = 2678.919
unit5 = 1287.876
unit6 = 123456.123
# all items will be right justified. A negative %-15d for example will make it
#left justified
print('%15s %15s' % ('Salesperson', 'units sold'))
print('--------------------------------------')
print('%15s %15.2f' % (sp1, unit1))
print('%15s %15.2f' % (sp2, unit2))
print('%15s %15.2f' % (sp3, unit3))
print('%15s %15.2f' % (sp4, unit4))
print('%15s %15.2f' % (sp5, unit5))
print('%15s %15.2f' % (sp6, unit6))

