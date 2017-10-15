a = open('integers.txt', 'w')
a.write('1\n')
a.write('1\n')
a.write('1\n')
a.write('1\n')

a.close()


f = open('integers.txt', 'r')
sum = 0
for line in f:
    line = line.strip()
    number = int(line)
    sum += number
print('The sum is', sum)


f = open('integers.txt', 'r')
sum = 0
for wordlist in f:
    wordlist = line.split()
    for word in wordlist:
        number = int(word)
        sum += number
print('The sum is', sum)

