def main():
    
    outfile = open('customers.txt', 'w')

    num1 = int(input('Enter a number 1:'))
    num2 = int(input('Enter a number 1:'))
    num3 = int(input('Enter a number 1:'))

    
    outfile.write(str(num1) + '\n')
    outfile.write(str(num2) + '\n')
    outfile.write(str(num3) + '\n')


    outfile.close()

main()
