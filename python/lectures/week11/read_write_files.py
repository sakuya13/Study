def approximate_song(filename):
    '''find the most frequent word in lyrics,
    if tie, return base on aphabetical order'''
    with open(filename) as txtfile:
        lyrics = txtfile.read()
        lyrics_list = [word for word in lyrics.split()]
        tally = {}
        for word in lyrics_list:
            if word in tally:
                tally[word] += 1
            else:
                tally[word] = 1
        tally_item = tally.items()
        sorted_key = sorted(tally_item, key=lambda words: words[0])
        sorted_item = sorted(sorted_key, key=lambda words: words[1],
                             reverse = True)
    return sorted_item[0][0]

print(approximate_song('fakesong.txt'))

def concatenate_files(filename1, filename2, new_filename):
    '''concatenation of two file into a new file'''
    with open(filename1) as f1:
        f1_content = f1.read()
    with open(filename2) as f2:
        f2_content = f2.read()
    with open(new_filename, 'w') as fin_file:
        fin_file.write(f1_content + f2_content)
