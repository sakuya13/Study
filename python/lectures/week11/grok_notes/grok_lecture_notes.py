'''
# csv.writer and writerows method (which convert list into strings)
open, write and read
'''
# open file
with open("path/to/file", "w") as outfile: 
    outfile.write("abc")

# error handling
try: 
    with open("path/to/file", "w") as outfile: 
        outfile.write("abc") 
except IOError: 
    print("Cannot write to the file !!!!")

# read the file only (by default, it is read mode)
with open("path/to/file", "r") as fi:
    fi.read()

# two ways to read lines in a file
fp = open("jabberwocky1.txt")
lineno = 1
for line in fp.readlines():
    print("{}: {}".format(lineno, line), end="")
    lineno += 1
fp.close()

fp = open("jabberwocky2.txt")
lineno = 1
for line in fp:  # note no readlines()
    print("{}: {}".format(lineno, line), end="")
    lineno += 1
fp.close()

# exercise 1
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
                             reverse=True)
    return sorted_item[0]

# write the file with append mode
fp = open("quotes.txt", "a")
fp.write("\n\n-Albert Einstein")
fp.close()
fp = open("quotes.txt", "r")
print(fp.read())
fp.close()

# overwrite the file
fp = open("quotes.txt", "w")
fp.write("\n\n-Albert Einstein")
fp.close()
fp = open("quotes.txt", "r")
print(fp.read())
fp.close()

# creating a file (previously does not exist)
fp = open("a_text_file.txt", "w")
fp.close()
fp = open("a_text_file.txt", "r")
fp.close()
print("See, no error!")

# exercise 2
def concatenate_files(filename1, filename2, new_filename):
    '''concatenation of two file into a new file'''
    with open(filename1) as f1:
        f1_content = f1.read()
    with open(filename2) as f2:
        f2_content = f2.read()
    with open(new_filename, 'w') as fin_file:
        fin_file.write(f1_content + f2_content)

'''
csv file
'''
# csv library
import csv
visitors = open("vic_visitors.csv")
for line in csv.reader(visitors):
    print(line)
visitors.close()

# read the header only
# the next function, which causes the iterable to return its first element,
# and iterate onto the next row of data. 
import csv
visitors = open("vic_visitors.csv")
data = csv.reader(visitors)
print(next(data))
visitors.close()

# calculate the average number of each row (ignoring the header and the first
# coloumn)
import csv
visitors = open("vic_visitors.csv")
data = csv.reader(visitors)
header = next(data)
for row in data:
    total = 0
    cols = 0
    for entry in row[1:]:
        total = total + float(entry)
        cols += 1
    print("{}: {:.0f}".format(row[0], total/cols))
visitors.close()

# convert the csv to 2d data
import csv
visitors = open("vic_visitors.csv")
data = csv.reader(visitors)
data_2d = list(data)
print(data_2d[3][2])
visitors.close()

# read using the csv.Dictreader()
import csv
cities = open("city_rainfall.csv")
for row in csv.DictReader(cities):
    total = 0
    for month in ("Jun", "Jul", "Aug"):
        total = total + float(row[month])
    print("{}: {:.0f}".format(row["city"], total/3))
cities.close()

import csv
# csv.writer and writerows method (which convert list into strings)
data_2d = [[1, 2, 3], [4, 5, 6]]
csv_file = open("2d-data.csv", "w")    
writer = csv.writer(csv_file)
writer.writerows(data_2d)
csv_file.close()

csv_file = open("2d-data.csv", "r")
print(csv_file.read())
csv_file.close()

# exercise sort the first column in alphabetical order
import csv
def sort_records(csv_filename, new_filename):
    '''sort the first column'''
    with open(csv_filename) as csvfile:
        data = csv.reader(csvfile)
        header = next(data)
        data_2d = list(data)
        sorted_data = sorted(data_2d, key=lambda words: words[0])
        sorted_data.insert(0, header)
    with open(new_filename, 'w') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(sorted_data)

sort_records('max_temp.csv', 'sorted.csv')
result = open('sorted.csv')
print(result.read())
result.close()

# exercise
import csv
def max_city_temp(csv_filename, city):
    with open(csv_filename) as csvfile:
        for line in csv.reader(csvfile):
            if line[0] == city:
                max_temp = max(line[1:], key=lambda t: float(t))
                return float(max_temp)

print(max_city_temp('max_temp.csv', 'Brisbane'))

# exercise
import csv
def hottest_city(csv_filename):
    '''FIND THE HOTTEST CITIES'''
    with open(csv_filename) as csvfile:
        next(csvfile)
        max_temp = '-265'
        hottest = []
        for line in csv.reader(csvfile):
            for entry in line[1:]:
                if float(entry) >= float(max_temp):
                    max_temp = entry
    with open(csv_filename) as csvfile:
        for line in csv.reader(csvfile):
            if max_temp in line[1:]:
                hottest.append(line[0])
    return float(max_temp), sorted(hottest)

print(hottest_city('max_temp.csv'))

import csv

def hottest_city(csv_filename):
    '''
    HOT!!!!!!!!!!!!!! ANOTHER METHOD BY A LOVELY CAT
    '''
    hottest = []
    maxtemp = -265
    with open(csv_filename, 'r') as cfi:
        next(cfi)
        for line in csv.reader(cfi):
            thismax = float(max(line[1:], key=lambda t: float(t)))
            if thismax > maxtemp:
                hottest.clear() # delete all items in hottest
                maxtemp = thismax
                hottest.append(line[0])
            elif thismax == maxtemp:
                hottest.append(line[0])
        return maxtemp, sorted(hottest)

print(hottest_city('max_temp.csv'))

