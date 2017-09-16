def find_repeat_substring(string):
    """
    find_repeat_substring takes string in str type and return number of 
    repetitions in int type and the repeating substring in str type.
    """
    i = 1
    length_of_string = len(string)
    while i <= length_of_string / 2:
        sub_string = string[:i]
        length_of_sub = len(sub_string)
        # length of string must be a multiple of that of the substring.
        if length_of_string % length_of_sub == 0:
            number_of_repetitions = length_of_string // length_of_sub
            if sub_string * number_of_repetitions == string:
                return number_of_repetitions, sub_string
        i += 1
    return -1, string


def main():
    """
    main takes input from user and prints the returned value of 
    find_repeat_substring.
    """
    string = input('Enter string: ')
    number_of_repetitions, sub_string = find_repeat_substring(string)
    if number_of_repetitions > 0:
        print('Congratulations, "' + string + '" is made up of ' +
              str(number_of_repetitions) + ' repetitions of "' + sub_string + 
              '"')
    else:
        print('Bummer, "' + string +
              '" is not made up of repetitions of a substring')
        
main()
