def main():
    """
    main takes input from user and print the returned value of equilateral.
    """
    length = input("Enter side lengths: ")
    if equilateral(length):
        print("The triangle is an equilateral triangle.")
    else:
        print("Sadly, the triangle is not equilateral. Find a better triangle.")

def equilateral(length):
    """
    equilateral takes length in str type and returns true if its an equilateral
    triangle and return false if it's not.
    """
    length_list = [int(x) for x in length.split()]
    return length_list[0] == length_list[1]\
           and length_list[0] == length_list[2]

main()
