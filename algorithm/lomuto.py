'''
lomuto partitioning
'''
def main():
    data = input('Enter a list of numbers (seperate with whitespaces): ')
    lst = [int(x) for x in data.split()]
    lo = 0
    hi = len(lst) - 1
    m = (lo + hi) // 2
    result = findmid(lst, lo, hi, m)
    print(result)
    # print(findmedian(lst, lo, hi, m))

def findpivot(lst, lo, hi):
    # print(lo)
    pivot = lst[lo]
    s = lo
    for i in range(lo + 1, hi + 1):
        if lst[i] < pivot:
            s += 1
            temp = lst[i]
            lst[i] = lst[s]
            lst[s] = temp
    temp = lst[s]
    lst[s] = lst[lo]
    lst[lo] = temp
    return s

def findmid(lst, lo, hi, m):
    s = findpivot(lst, lo, hi)
    print(lst)
    # print("s",s, "lo", lo)
    # print("lst",lst, "lst[s]", lst[s])
    if s - lo == m:
        #print(lst[s])
        return lst[s]
    else:
        if s - lo > m:
            # must return here to pass the result of the function to main().
            return findmid(lst, lo, s - 1, m)
        else:
            # new list count from s+1, thus, cut off s-lo+1.
            return findmid(lst, s + 1, hi, m - (s - lo + 1))

main()
