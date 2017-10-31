def brute_string(t, p, n, m):
    '''T is the long text with length n, P is the pattern with length m'''
    for i in range(0, n-m+1):
        j = 0
        while j < m and p[j] == t[i+j]:
            j += 1
        if j == m:
            return i
    return -1

def debug():
    t = 'abcdefgh'
    p = 'ef'
    print(brute_string(t, p, len(t), len(p)))

debug()
