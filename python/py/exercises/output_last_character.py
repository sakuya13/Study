s = input("Enter some text: ")
print(s[2])
last_character = s[-1]
f = ["!", "?", ".", ","]
if last_character in f:
    print(s[-2])
else:
    print(last_character)

