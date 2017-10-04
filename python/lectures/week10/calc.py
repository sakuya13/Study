
# add two values together
def plus(v1, v2):
        return v1 + v2

# minus value one from value two 
def minus(v1, v2):
    return v1 - v2

# multiply two values together
def times(v1, v2):
    return v1 * v2

# devide two values
def divide(v1, v2):
    if v1 != 0 and v2 != 0:
        ans = v1 / v2
        return ans
    else:
        return "No Can Do!"

# add two values together
def main():
    print(plus(0,2))
    print(minus(2,3))
    print(divide(0,0))
    print("This is the end of the program")

# main method 
main()
