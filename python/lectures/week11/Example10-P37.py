def main():
    employee_file = open ('employee.txt', 'r')
    
    #read first line from file, which is the name filed of first record
    name = employee_file.readline()
    while name != '':
        id_num = employee_file.readline()
        dept = employee_file.readline()        
        #strip the newlines fro the field
        name = name.rstrip('\n')
        id_num = id_num.rstrip('\n')
        dept = dept.rstrip('\n')
        #display records
        print('name:', name)
        print('id:', id_num)
        print('dept:', dept)
        print()
        name = employee_file.readline()
    employee_file.close()
        
main()
