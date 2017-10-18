# sample exam - section C question
def  equiword(word):
    from  collections import  defaultdict
    letter_dict = defaultdict(int)
    #print(letter_dict, word)
    for  letter in  word:
        letter_dict[letter] += 1
    letter_freq_list = sorted (letter_dict.values())
    #print(letter_freq_list, word)
    if word and letter_freq_list == letter_freq_list[::-1]:
        return  letter_freq_list[0]
    return  False

def main():
    word = input ('Enter a string:')
    n = equiword(word)
    print(n)
main()
