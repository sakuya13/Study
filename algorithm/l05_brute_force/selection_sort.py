def selsort(array, n):
    for i in range(0, n-1):  # note that in pseudocode, all boundary are included.
        minimal = i
        for j in range(i+1, n):
            if array[j] < array[minimal]:
                minimal = j
        temp = array[i]
        array[i] = array[minimal]
        array[minimal] = temp
    return array

def debug():
    array = [4, 3, 2, 7, 6]
    sorted_array = selsort(array, len(array))
    print(sorted_array)

debug()
