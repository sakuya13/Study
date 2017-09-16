matrix = [
    [0, 1, 1, 1, 1, 1, 0],
    [0, 0, 0, 1, 0, 1, 0],
    [1, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 1, 1, 0],
    [0, 1, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0]
]
n = len(matrix)

def attractor(A, n):
    i = 0
    j = 0
    while i <= n - 1 and j <= n - 1:
        if A[i][j] == 1:# If (i, j) == 1, i cannot be attractor(universal sink)
            i += 1
        else:
            j += 1
    return i

def main():
    print(attractor(matrix, n))

main()
