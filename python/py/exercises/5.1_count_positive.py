countPositive = 0
countNegative = 0
total = 0
average = 0
num = 1
while num != 0:
    num = eval(input("Enter an integer, the input ends if it is 0: "))
    total = total + num
    if num == 0 and total == 0:
        print("You didn't Enter any number")
        break
    if num > 0:
        countPositive += 1
    elif num < 0:
        countNegative += 1
    average = total / (countNegative + countPositive)
if total != 0:
    print("The number of positives is", countPositive)
    print("The number of negatives is", countNegative)
    print("The total is", total)
    print("The average is", average)
