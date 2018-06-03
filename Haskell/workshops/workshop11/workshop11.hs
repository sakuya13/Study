-- Q1
fibs :: Int -> [Integer]
fibs 0 = []
fibs n = undefined


-- O(logn) ver.
fib n = fib' n 1 0

fib' n a b =
    if n == 0 
    then a
    else fib' (n-1) (a+b) a


