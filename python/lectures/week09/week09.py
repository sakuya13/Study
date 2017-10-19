'''
function
local and global variable
'''
# the variable pass, this one will trigger error because in the function bob, x
# is not defined
x = 10
def bob1():
    x += 1
    print(x)
bob1()
# use globle to retrive the variable outside the function
# don't use global
x = 10
def bob2():
    global x
    x = x + 1
    print(x)
bob2()

# better do it this way
VOWELS = 'aeiou'  # as global variable

def is_vowel(letter):
    return(letter in VOWELS)

def vowel_count(word):
    vowels = 0
    for i in word:
        if is_vowel(i):
            vowels = vowels + 1
    return(vowels)

print(vowel_count("banana"))

# pass the variable when calling the funciton(parameter)
x = 10
def bob3(lunch):
    lunch += 2
    print(lunch)
bob3(x)

# nested functions share local variables
def vowel_count(word):
    def is_vowel(letter):
        print(i)
        return letter in 'aeiou'
    vowels = 0
    for i in word:
        if is_vowel(i):
            vowels = vowels + 1
    return vowels

i = "banana"
print(i)
vowel_count(i)
print(i)
print(vowels)

# in list or (mutables?), any changes to the local variable will
# also affect global variable
# guess the output of the three pieces of code
# 1
lst = [1, 2, 3]
lst.append(4)
print(lst)
# 2
def append(lst2, item):
    lst2.append(item)

lst = [1, 2, 3]
append(lst, 4)
print(lst)
# 3 call by object
lst = [1, 2, 3]
lst2 = lst
lst2.append(4)
print(lst)

# break the bound between the two objects
lst = [1, 2, 3]
lst2 = lst + []
lst2.append(4)
print(lst)

