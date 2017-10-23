'''
iterator
Iterators are similar to sequences, but differ in some important ways, 
as summarised below:

Sequences:

1. Have random access (you can access any element in the sequence, 
   as many times as you like)
2. No position tracking within the sequence
3. You can use len() to calculate the length
4. Must be finite
5. You can traverse it many times

Iterators:

1. No random access
2. Remembers where you are up to
3. Cannot use len()
4. Can be infinite
5. You can only traverse it once, forwards.
'''
list1 = [1, 5]
my_iterator = iter(list1)
print(next(my_iterator))
print(next(my_iterator))

# This will generate an error because we have reached the end.
print(next(my_iterator))

'''
the second print never runs, because in acts like iter() + next() here,
we already reached the end of the lst in the for loop
'''
lst = [5, 4, 6]
my_iterator = iter(lst)

# sum up the elements of `lst`
count = 0
for num in my_iterator:
    count += num
print("count: ", count)

# print out the elements of `lst`
for num in my_iterator:
    print(num)

'''
library itertools permutations(iterable, r),
which returns an iterator which generates all the permutations of
length r from the elements of the iterable,
with each permutation in the form of a tuple of length r.

Note that permutations generates items based on the order the
elements occurred in the original iterable, such that if the original is sorted,
permutations will preserve this in generating the permutations in sort order.
'''
# generating permutations
from itertools import permutations
for i in permutations("ABC", 2):
    print(i)

'''
Similar to a permutation, a combination is a subset of elements from a set of elements,
without regard for the internal order of the elements. For example, given ABC,
AB and BA would be considered the same combination.
here are 3 combinations of length 2 from those 3 letters: AB, AC, and BC.

The combinations(iterable, r) method returns an iterator which generates
all possible combinations of elements of length r, once again in the form of
a series of tuples. What happens if r is larger than the length of the iterable?
Try it by modifying the code below:
'''
# combinations or subset
from itertools import combinations 
for i in combinations('abc', 2):
    print(i)

'''
with the cycle(iterable) method.
Cycle takes an iterable and simply steps through it over and over again.
Indefinitely.

Note that we used a while loop here with a stopping criterion based on the
number of cycles, and not a simple for loop. Why not? Try modifying the code to see
what happens with a for loop and no use of count to limit the number of iterations.
'''
from itertools import cycle
my_iterator = cycle("ABC")
count = 12
while count:
    print(next(my_iterator))
    count -= 1

from itertools import chain
chain('abc', 'def')

'''
exercise
'''
from itertools import permutations

LIKELY_WORDS = ["Frenchy", "INTENSE", "ComputerScienceFTW", "HelloMrGumby"]
MIDDLE = "Horse20"
CREME_PUFF = 38

def hack_it(start=LIKELY_WORDS, middle=MIDDLE, end=CREME_PUFF):
    # your code here
    password_list = []
    for word in permutations(start, 2):
        for digit in range(end + 1):
            password = word[0] + word[1] + middle + '{:02d}'.format(digit)
            password_list.append(password)
    return password_list

# answer
def hack_it(start=LIKELY_WORDS, middle=MIDDLE, end=CREME_PUFF):
    passwords = []
    for first_bit in permutations(start, 2):
        for last_bit in range(end + 1):
            # {:02d} generating 00, 01, 02...when first_bit in range(0, 10)
            # join() method: ''.join(('1', '2')
            passwords.append("{}{}{:02d}".format("".join(first_bit),
                                                 middle, last_bit))
    return passwords

print(hack_it(start=LIKELY_WORDS, middle=MIDDLE, end=CREME_PUFF))