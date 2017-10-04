def main():
    numbers = [1,2,3,4,5,6]
    total , average = get_values(numbers)
    
    print('Total is', total, 'Average is', average)

def get_values(list):
    total = 0.0
    for num in list:
        total = total+num
    average = total/len(list)
    return total, average

main()
