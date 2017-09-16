word = input("Enter word: ")
sentence = input("Enter sentence: ")
list_1 = sentence.split()
is_anagram = False
for word1 in list_1:
    if sorted(word1) == sorted(word):
        print("True")
        break
if not is_anagram:
    print("False")