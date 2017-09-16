name = input("Enter your full name: ")
if "Mr " not in name and "Ms " not in name and "Miss " not in name:
    print("Good day!")
elif "Mr " in name and ("Ms " not in name or "Miss " not in name):
    print("Good day Sir!")
elif ("Ms " in name or "Miss " in name) and "Mr " not in name:
    print("Good day Ma'am!")
