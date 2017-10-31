a = [4, 5, 6, 2, 7, 0, 3]
length = len(a)

def insertion_sort(lst, n):
    for i in range(1, n):
        v = lst[i]
        j = i - 1
        while j >= 0 and v < lst[j]:
            lst[j+1] = lst[j]
            j -= 1
        lst[j+1] = v
    return lst

print(insertion_sort(a, length))
