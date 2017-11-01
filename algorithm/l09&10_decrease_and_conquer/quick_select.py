'''
lomuto partitioning
'''
def main():
    data = input('Enter a list of numbers (seperate with whitespaces): ')
    k = int(input('Enter k: '))
    lst = [int(x) for x in data.split()]
    lo = 0
    hi = len(lst) - 1
    result = find_kth(lst, lo, hi, k)
    print(result)

def findpivot(lst, lo, hi):
    # print(lo)
    pivot = lst[lo]
    s = lo
    for i in range(lo + 1, hi + 1):
        if lst[i] < pivot:
            s += 1
            swap(lst, i, s)
    swap(lst, s, lo)
    return s

def find_kth(lst, lo, hi, k):
    s = findpivot(lst, lo, hi)
    if s - lo == k - 1:
        return lst[s]
    else:
        if s - lo > k - 1:
            # must return here to pass the result of the function to main().
            return find_kth(lst, lo, s - 1, k)
        else:
            # new list count from s+1, thus, cut off s-lo+1.
            return find_kth(lst, s + 1, hi, (k - 1) - (s - lo))

def swap(lst, i, j):
    temp = lst[j]
    lst[j] = lst[i]
    lst[i] = temp

main()
