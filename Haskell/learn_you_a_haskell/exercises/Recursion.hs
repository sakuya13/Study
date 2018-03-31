-- Raise x to the power y, using recursion
-- power 5 2 = 25
power :: Int -> Int -> Int
power x 0 = 1
power x 1 = x
power x y = x * power x (y-1)

-- Create a list of length n of the fibbonaci sequence in reverse order
-- fib 0 = [0]
-- fib 1 = [1,0]
-- fib 10 = [55,34,21,13,8,5,3,2,1,1,0]
fib :: (Num a, Eq a) => a -> [a]
fib 0 = [1]
fib 1 = [1]
fib n = fib (n-1) ++ fib (n-2)


