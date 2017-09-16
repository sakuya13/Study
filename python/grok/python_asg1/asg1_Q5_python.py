def main():
    """
    main takes input from user and print the returned value of unexpected_char
    and sum_and_mean.
    """
    input_string = input("Enter integers: ")
    unexpected_char = filter_unexpected_char(input_string)
    if unexpected_char == "":
        split_string = input_string.split(" ")
        integer_list = convert_to_int(split_string)
        sum_and_mean(integer_list)
        sums, mean = sum_and_mean(integer_list)
        print("Sum:", sums)
        print("Mean:", mean)
    else:
        print("Error: invalid character \"" + unexpected_char + "\"")
        
def filter_unexpected_char(string):
    """
    filter_unexpected_char takes string in str type and return char in str type
    or an empty string.
    """
    for char in string:
        if not char.isdigit() and char != " ":
            return char
    return ""

def convert_to_int(string):
    """
    convert_to_int takes string in str type and return an integer_list 
    in int type.
    """
    integer_list = []
    for char in string:
        # filter empty strings caused by extra whitespaces.
        if char != "":
            integer_list.append(int(char))
    return integer_list

def sum_and_mean(integer_list):
    """
    sum_and_mean takes an integer_list in int type and return sums in int
    type and mean in float type.
    """
    sums = 0
    mean = 0.0
    length = len(integer_list)
    if length > 0:
        for i in integer_list:
            sums += i
        mean = sums / length
    return sums, mean

main()
