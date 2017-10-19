'''
library
'''
import math

# some math methods
print(math.sqrt(144))
print(math.log10(1000000))
print(math.factorial(10))
print(math.pi)  # constant does not have brackets
print(math.e)

# avoid typing long library names, save them as variables
import math as m
print(m.pi)
print(m.sqrt(2))
# alternative way
from math import pi, sqrt
print(pi)
print(sqrt(2))
print(e)
# import all methods in the library
# not recommended because multible method names may clash
from math import *
print(pi)
print(sqrt(2))
print(e)

'''
default dictionary
'''
# default dictionary from collections
from collections import defaultdict
# create a default dictionary
my_dict = defaultdict(int)
print(my_dict)
# try to access the element "joe" which is not in it.
a = my_dict["joe"]
# notice the value that was returned and that it was added to the dictionary.
print(a)
print(my_dict)
d = defaultdict(int, {'a': 2})
d['b'] = 'hah!'
print(d)

# A frequency count of the letters in my_dict.
my_dict = {}
my_string = "I want to go home now"
for char in my_string:
    if char in my_dict:
        my_dict[char] += 1
    else:
        my_dict[char] = 1
# simplify the function to:
from collections import defaultdict

my_dd = defaultdict(int)
my_string = "I want to go home now"
for char in my_string:
    my_dd[char] += 1
print(my_dd)

'''
trump's speech
'''
from collections import defaultdict

def count_lengths(text):
    word_len_list = [len(word) for word in text.split()]
    word_len_dict = defaultdict(int)
    for length in word_len_list:
        word_len_dict[length] += 1
    return word_len_dict

def top5_word_lengths(text):
    word_len_dict = count_lengths(text)
    # here, sort with k[1] first, then with k[0]. The latter will solve the
    # case of a tie in frequence
    sorted_word_len = sorted(word_len_dict.items(), key=lambda k: (k[1], k[0]),
                             reverse=True)
    top5_list = []
    for item in sorted_word_len[:5]:
        top5_list.append(item[0])
    return top5_list

# alternative way
def count_lengths(text):
    """ Takes a string and returns a defaultdict with the frequency counts."""
    length_freq = defaultdict(int)
    for word in text.split():
        length_freq[len(word)]+=1
    return length_freq

def top5_word_lengths(text):
    """takes a string text and returns a list of the top five most frequent 
    word lengths in text."""
    length_freq = count_lengths(text)
     
    # Store the word lengths and their frequency counts in the list 
    # length_freq_list.
    length_freq_list = [(freq, length) for length, freq in length_freq.items()]

    # Sort the frequency lengths and store them in top5.
    top5 = []
    for freq, length in sorted(length_freq_list, reverse=True)[:5]:
        top5.append(length)
    return top5

complements = {'A':'T', 'C':'G', 'T':'A', 'G':'C'}
pool1 = ['AAG', 'TAC', 'CGG', 'GAT', 'TTG', 'GTG', 'CAT', 'GGC', 'ATT', 'TCT']
pool2 = ['TAA', 'CTA', 'AAC', 'TTC', 'AGA', 'CCC', 'CCG', 'GTA']

def matching_codons(complements, pool1, pool2):
    '''
    condon pairs
    '''
    pair_list = []
    for codon1 in pool1:
        codon2 = complements[codon1[0]]+complements[codon1[1]]+\
                 complements[codon1[2]]
        if codon2 in pool2:
            pair_list.append((codon1, codon2))
    return pair_list

print(matching_codons(complements, pool1, pool2))

def grey_value(image):
    '''
    grey value
    '''
    count_white = 0
    for item in image:
        for value in range(len(item)):
            if item[value] == 1:
                count_white += 1
    grey = count_white / (len(image)*len(item))
    return grey

'''
complex list comprehension
'''
words = "Elephants are large mammals. They are known to eat predominantl\
         grass and tree foliage. As with most mammals,\
         they do not lay eggs".lower().split()
message = [word2.rstrip("s") for word2 in \
    [word for word in words if word[0] == "e"] \
    if len(word2) >= 2 and word2[-2] != "s"]
print(message)