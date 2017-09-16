def top5_words(text):
    word_list = text.split()
    tally = {}
    for word in word_list:
        if word in tally:
            tally[word] += 1
        else:
            tally[word] = 1
    print(set(list(tally.values())))
    print(set(tally.values()))
    print(tally.values())
    tally_item = tally.items()
    s = sorted(tally_item, key=lambda item: item[0])
    #print(s)
    sorted_list = sorted(s, key=lambda item: item[1], reverse=True)
    #print(sorted_list)
    top5_list = []
    sorted_list_length = len(sorted_list)
    if sorted_list_length < 5:
        for item in range(sorted_list_length):
            top5_list.append(sorted_list[item][0])
    else:
        for item in range(5):
            top5_list.append(sorted_list[item][0])
    return top5_list

top5_words('the quick brown fox jumped over the lazy dog')