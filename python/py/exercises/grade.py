num = int(input("Please enter your Grades: "))
if num > 100 or num < 0:
    print("Fatal error.")
elif num >= 80:
    print("Your Grade is H1.")
elif num >= 75:
    print("Your Grade is H2A.")
elif num >= 70:
    print("Your Grade is H2B.")
elif num >= 50:
    print("Your Grade is P.")
else:
    print("Your Grade is F.")
    