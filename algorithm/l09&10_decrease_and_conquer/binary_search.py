from math import floor

lst = [1, 2, 3, 4, 5, 6]
k = 5
n = len(lst)

def bin_search(list, k, n):
    hi = n - 1
    lo = 0
    while lo <= hi:
        m = floor((lo + hi) / 2)
        if list[m] == k:
            return m
        if list[m] > k:
            hi = m - 1
        else:
            lo = m + 1
    return -1

print(bin_search(lst, k, n))
