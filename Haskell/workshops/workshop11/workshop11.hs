-- Q1
-- O(n^2) ver.
fibs :: Int -> [Integer]
fibs (-1) = []
fibs n = fibs (n-1) ++ [fib n]


-- O(nlogn) ver.
fibonacci :: Int -> [Integer]
fibonacci n = fibs1 n []

fibs1 :: Int -> [Integer] -> [Integer]
fibs1 (-1) acc = acc
fibs1 n acc = fibs1 (n-1) ((fib n):acc)


-- O(logn) when calculating a single fib
fib :: Int -> Integer
fib n = fib' n 1 0

fib' :: Int -> Integer -> Integer -> Integer
fib' n a b =
    if n == 0 
    then a
    else fib' (n-1) (a+b) a


-- TODO: O(n) ver.
f :: Int -> [Integer]
f 0 = []
f 1 = [0]
f n | n > 1 = 0:1:f1 0 1 (n-2)

f1 fpp fp 0 = []
f1 fpp fp n = (fpp+fp):f1 fp (fpp+fp) (n-1)


-- Q2 TODO: this is amazing!
-- O(n), have a higher constant factor than the above one
allfibs1 :: [Integer] -> [Integer]
allfibs1 [] = []
allfibs1 fibs@(_:xs) = zipWith (+) fibs xs

-- lazy evaluation
--   0 1 1 2 3 5 8 ...
-- + 1 1 2 3 5 8 ...
-- = 1 2 3 5 8 ...
allfibs :: [Integer]
allfibs = 0:1:zipWith (+) allfibs (tail allfibs)

fibon :: Int -> [Integer]
fibon n = take n allfibs


