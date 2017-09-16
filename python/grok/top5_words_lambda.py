def top5_words(text):
    word_list = [word for word in text.split()]
    tally = {}
    for word in word_list:
        if word in tally:
            tally[word] += 1
        else:
            tally[word] = 1
    tally_item = tally.items()
    s = sorted(tally_item, key=lambda words: words[0])
    sorted_list = sorted(s, key=lambda words: words[1], reverse=True)
    top5_list = []
    sorted_list_length = len(sorted_list)
    if sorted_list_length < 5:
        for item in range(sorted_list_length):
            top5_list.append(sorted_list[item][0])
    else:
        for item in range(5):
            top5_list.append(sorted_list[item][0])
    return top5_list
