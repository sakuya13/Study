word = input('Enter a word: ')
sentence = input('Enter a sentence: ')
sentence_list = sentence.split()
valid_word = ''
for word_in_list in sentence_list:
    if len(word_in_list) == len(word):
        valid_word = word_in_list
        break
count = 0
for char in word:
    if char in valid_word:
        count += 1
if count == len(word):
    print('True')
else:
    print('False')
