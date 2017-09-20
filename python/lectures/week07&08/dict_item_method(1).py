employee_record = {'name': 'kevin', 'Age': 43, 'ID':23145, 'payrate':24.99}
employee_record = {'name': [1, 2, 3, 4], 'Age': [43, 23, 34, 45],
                'ID':23145, 'payrate':24.99}
# one way of getting all elements
for key, value in employee_record.items():
    print(key, value)

#another way
for key in employee_record:
    print(key, employee_record[key])

# using the method keys
for key in employee_record.keys():
    print(key)

#using the method keys
for value in employee_record.values():
    print(value)

# accesse value the output is a tuple
employee_record.values()  # it returns: 
# 'dict_values([[1, 2, 3, 4], [43, 23, 34, 45], 23145, 24.99])'

# two ways of accessing the value of certain key
employee_record['Age'][3]
list(employee_record.values())[1][3]  # here we us list fuction because values 
# function returns a tuple

# illustrate using the pop method
employee_record.pop('Age', 'not found')
print(employee_record)
print(employee_record.pop('Age', 'not found'))
