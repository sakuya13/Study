# sample exam - change the loop from while to for
"""
count = 0
items = ['eggs', 'spam', 'moreeggs']
while count < len(items):
    print("We need to buy {0}!".format(items[count]))
    count += 1
"""
items = ['eggs', 'spam', 'moreeggs']
for item in items:
    print("We need to buy {0}!".format(item))
