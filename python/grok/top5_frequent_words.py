from operator import itemgetter

def top5_words(text):
    word_list = [word for word in text.split()]
    tally = {}
    for word in word_list:
        if word in tally:
            tally[word] += 1
        else:
            tally[word] = 1
    tally_item = tally.items()
    #tally_pair_list = []
    print(tally_item)
    s = sorted(tally_item, key=itemgetter(0))
    sorted_list = sorted(s, key=itemgetter(1), reverse=True)
    print(sorted_list)
    #for pairs in tally_item:
    #    pairs = pairs[::-1]
    #    tally_pair_list.append(pairs)
    #print(tally_pair_list)
    
    #sorted_item = list(reversed(sorted(tally_pair_list)))
    #return sorted_item
    top5_list = []
    sorted_list_length = len(sorted_list)
    if sorted_list_length < 5:
        for item in range(sorted_list_length):
            top5_list.append(sorted_list[item][0])
    else:
        for item in range(5):
            top5_list.append(sorted_list[item][0])
text = 'one one was a racehorse two two was one too'
print(top5_words(text))