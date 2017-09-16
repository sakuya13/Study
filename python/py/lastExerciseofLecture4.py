s = input("Please enter the title in uppercase: ")
if len(s) > 10:        
    print("Your title should contain no more than 10 words")
else:
    print("Your title is " + s.upper() + ".")
    print("There are", len(s), "Words in your title.")