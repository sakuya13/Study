-- builtin types
-- type           
-- Bool           True False
-- Int            native integers with 32 and 64 bit bounded
-- Integer        unbounded
-- Double         Float is also available, but discouraged
-- Char           character type
-- String         equals to [Char]
--
-- tpye constructor
-- as well as type names should be indentifiers starting with an upper case letter
-- list           [t] [Bool] [Int] [[Int]] [Char]

-- module Emptiness where

isEmpty :: [t] -> Bool
isEmpty [] = True
isEmpty _  = False

-- Quiz: Summing a list
sum1 :: [Int] -> Int
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs


-- numeric types Num: Int, Integer, Float, Double.
-- 3 :: (Num t) => t
-- 0.5 :: (Fractional t) => t
-- (+) :: (Num a) => a -> a -> a

-- Quiz: sumlist works for a lists of any numeric type
sumlist :: (Num a) => [a] -> a
sumlist [] = 0
sumlist (x:xs) = x + sumlist xs


-- if then else
iota n = 
    if n == 0 
    then []
    else iota (n-1) ++ [n]


-- guards
iota' n
  | n == 0 = []
  | n  > 0 = iota (n-1) ++ [n]

-- what happens when n < 0 for the above two iota?
-- iota n seems to run infinitely
-- iota' n will catch an exception
-- solution
iota'' n = if n <= 0 then [] else iota (n-1) ++ [n]
iota''' n
  | n <= 0 = []
  | n  > 0 = iota (n-1) ++ [n]


-- parametric polymorphism
len :: [t] -> Int
len [] = 0
len (_:xs) = 1 + len xs


