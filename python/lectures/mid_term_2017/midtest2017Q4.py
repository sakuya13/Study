word = input('Enter: ')
encript_word = []
ordinal = 0
for char in word:
    ordinal = ord(char) + 1
    encript_word.append(chr(ordinal))
for char in encript_word:
    print(char, end='')
print()
#print(''.join(encript_word))

#for char in word:
#    print("213312", chr(ord(char)+1), end='')
#print()


#def encrypt2(chars):
#    return "".join()


