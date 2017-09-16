# brute force way
s = "TACAAGCGA"
n = len(s)

def count_substring_1(s):
    count = 0
    for i in range(0, n-1):
        if s[i] == "A":
            for j in range(i + 1, n):
                if s[j] == "C":
                    count = count + 1
    return count


# linear way
def count_substring_2(s):
    count_A = 0
    count_AC = 0
    for i in range(0, n):
        if s[i] == "A":
            count_A += 1
        if s[i] == "C":
            count_AC += count_A
    return count_AC

def main():
    print(count_substring_2(s))
    print(count_substring_1(s))
main()
