import random
number1 = random.randint(0, 99)
number2 = random.randint(0, 99)
answer = eval(input("Please calculate " + \
    str(number1) + " plus " + str(number2) + "? "))
if answer == number1 + number2:
    print("Right answer!")
else:
    print("Fat fat bnu!! The answer is", number1 + number2)