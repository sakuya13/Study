def main():
    """
    main takes input from user and prints the returned value of count_digit.
    """
    number = input("Enter the number: ")
    count, sums = count_digit(number)
    print("The number contains", count, "digits")
    print("The digits sum to", sums)

def count_digit(n):
    """
    count_digit takes a number in str type and returns count and sums 
    in int type.
    """
    nums = list(n)
    count = 0
    sums = 0
    for i in range(len(nums)):
        if nums[i].isdigit():
            count += 1
            sums += int(nums[i])
    return count, sums

main()
