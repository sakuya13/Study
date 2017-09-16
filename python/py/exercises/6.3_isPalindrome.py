# Return the reversal of an integer, e.g. reverse(456) returns # 654
def main():
    i = input("Enter an integer: ")
    n = list(i)
    print(i, "is plindrome is " + str(isPalindrome(n)) + ".")

def reverse(n):
    return n[::-1]

# Return true if number is a palindrome
def isPalindrome(n):
    if reverse(n) == n:
        return True
    else:
        return False

main()

