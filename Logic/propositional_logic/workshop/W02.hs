-- Q3 find all the paths from from lower left of a grid m n to its upper right
paths :: Integer -> Integer -> Integer
paths _ 1 = 1
paths 1 _ = 1
paths m n = (paths (m-1) n) + (paths m (n-1))

paths' :: Integer -> Integer -> Integer
paths' n m = k (n+m-2) (m-1)
k n m = num `div` den
    where
        num = product [(n-m+1)..n]
        den = product [1..m]

