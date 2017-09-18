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
    for k in range(n):
        for j in range(n):
            if k != j:
                if A[k][j] == 0 and A[j][k] == 1:
                    i = k
                else:
                    i = 0
                    break
        if i != 0:
                return i
    return 0


def main():
    print(attractor(matrix, n))

main()
