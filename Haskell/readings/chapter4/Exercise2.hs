import Data.Char (digitToInt)
-- Q1
-- without fold
asInt :: String -> Int
asInt = loop 0

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                  in loop acc' xs

-- using foldl
asInt' :: String -> Integer
asInt' [] = 0
asInt' (x:xs)
    | x == '-'  = negate (foldl step 0 xs)
    | otherwise = foldl step 0 (x:xs)
    where step acc x = acc*10 + dig x
          dig = toInteger . digitToInt

-- using foldr
f :: String -> Integer
f xs = fst $ foldr step (0, 1) xs
    where step x (acc, exp) = (acc + exp * dig x, exp * 10)
          dig = toInteger . digitToInt

n = 1000
cool = concat $ replicate n ['1'..'9']

