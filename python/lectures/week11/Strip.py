# check example 2 and redo it to give the correct output by stripping the \n

def main():
    infile = open ('customers.txt', 'r')
    #read the three lines from the file
    line1 = infile.read()
    line2 = infile.readline()
    line3 = infile.readline()
    
    #strip the \n from each string
    line1 = line1.rstrip('\n\r')
##    line2 = line2.rstrip('\n\r')
##    line3 = line3.rstrip('\n\r')
        
    # close the file
    infile.close()
    #print the lines
    print(line1)
##    print(line2)
##    print(line3)
main()
