def main():
    # get the total number of employees recorsd you want to create
    num_emps = int(input('how many employee records:'))
    #open a file to write the information
    employee_file = open ('employee.txt', 'w')
    # get the data from user
    for count in range(1, num_emps+1):
        print('enter data for employee #', count)
        name = input('name:')
        id_num = input('ID:')
        dept = input('department:')
        # write the data - record into the file
        employee_file.write(name + ', ')
        employee_file.write(id_num + ', ')
        employee_file.write(dept + '\n')
        print()
    employee_file.close()
main()
