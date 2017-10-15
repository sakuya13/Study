def main():
    myfile = open('customer.txt', 'w')

    num_days = int(input('how many days of sales figures?'))

    sales_file = open('sales.txt', 'w')

    for count in range(num_days):
        
        sales = float(input('enter sales for day #' + str(count+1) + ':'))
        sales_file.write(str(sales) + '\n')
        
    sales_file.close()

main()
