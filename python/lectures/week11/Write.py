def main():
    # open a file named customers.txt
    infile = open('customers1.txt', 'w')
    
    # write the names of three custome
    infile.write('Alice\n')
    infile.write('David\n')
    infile.write('Tim\n')
    #close the file
    infile.close()
main()

