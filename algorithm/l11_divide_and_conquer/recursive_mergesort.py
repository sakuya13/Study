def merge_sort(lst):
    if len(lst) == 0 or len(lst) == 1:
        return lst
    mid = len(lst) // 2
    left = merge_sort(lst[:mid])
    right = merge_sort(lst[mid:])
    return merge(left, right)

def merge(a, b):
    c = []
    while len(a) != 0 and len(b) != 0:
        c.append(a.pop(0) if a[0] <= b[0] else b.pop(0))  # ternary operator??
    c.extend(a)
    c.extend(b)
    return c

def debug():
    lst = [3, 65, 42, 78, 23, 10, 5, 7]
    print(merge_sort(lst))

debug()
