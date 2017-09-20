sentence = 'this example has five words'
words = sentence.split()
print(words)
index = 0
while index < len(words):
    words[index] = words[index].upper()
    index = index + 1
print(words)
