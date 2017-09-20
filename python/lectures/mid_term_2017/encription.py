def encrypt(chars): 
    return "".join(map(lambda c: chr((ord(c) + 1 - ord("a")) % 26 + ord("a")), chars)) 

#limit the iteration only to 26 lowercase characters.
def encrypt2(chars):
    def translatecode(char):
        base = ord("a")
        chrcodeold = ord(char) + 1
        chrcode = (ord(char) - base + 1) % 26 + base
        return chr(chrcode)

#igore the situation that the char my exceed the 26 characters.
def encrypt3(chars):
    a = ''
    for char in input(''):
        a += chr(ord(char) + 1)
    print('encription is: '+ a)
