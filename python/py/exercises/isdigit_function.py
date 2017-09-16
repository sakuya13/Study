name = input("Enter your name, soldier: ")
if name == "":
    print("A luddite! GO AWAY AT ONCE!")
elif name.isdigit() and 0 <= int(name) <= 2:
    print("HAHA! You may not pass!!")
else:
    print("Welcome to the camp,", str(name) + ", if that really is your name.")
    