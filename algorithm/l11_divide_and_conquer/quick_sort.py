def quicksort(lst, lo, hi):
    if lo < hi:
        s = partition(lst, lo, hi)
        quicksort(lst, lo, s - 1)
        quicksort(lst, s + 1, hi)

def partition(lst, lo, hi):
    p = lst[lo]
    i = lo
    j = hi
    while i < j:
        while i < hi and lst[i] <= p:
            i += 1
        while j >= lo and lst[j] > p:
            j -= 1
        swap(lst, i, j)
    swap(lst, i, j)
    swap(lst, lo, j)
    return j

def swap(lst, i, j):
    temp = lst[j]
    lst[j] = lst[i]
    lst[i] = temp

def debug():
    lst = [3, 65, 42, 78, 23, 10, 5, 7]
    lo = 0
    hi = len(lst) - 1
    quicksort(lst, lo, hi)
    print(lst)

debug()
