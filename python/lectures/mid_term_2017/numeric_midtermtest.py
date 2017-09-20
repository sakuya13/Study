#text = 'Here is a line of text'
#print(enumerate(text))
#for index, letter in enumerate(text):
#    print('{} is at index {}'.format(letter, index))
#print('The end')



for index, number in enumerate([1, 2, 3, 4, 5, 6, 7, 8, 9]):
    if index == 5:
        continue
    if index == 8:
        break
    print(number, end=' ')
print('end')
