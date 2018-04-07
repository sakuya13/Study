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
fib n = fib' n [0]
    where fib' 0 xs = xs
          --fib' n [] = fib' (n-1) [0]
          fib' n [_] = fib' (n-1) [1,0]
          fib' n xs@(x:y:_) = fib' (n-1) ((x+y):xs)

-- Create a function which takes two parameters, a number and a step
-- The result is the sign of the original number reversed, and the step added
-- to the absolute value
-- stepReverseSign 6 2 = -8
-- stepReverseSign -3 1 = 4
-- stepReverseSign 1 2 = -3
