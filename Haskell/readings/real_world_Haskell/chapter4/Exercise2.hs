module Exercise2 where

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


-- Q6
concat' :: [[a]] -> [a]
concat' [] = []
concat' xs = foldr (++) [] xs

-- Q7
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x:xs)
    | p x       = x : takeWhile' p xs
    | otherwise = takeWhile' p xs

takeWhile'' :: (a -> Bool) -> [a] -> [a]
takeWhile'' _ [] = []
takeWhile'' p xs = foldr step [] xs
    where step x ys
            | p x       = x : ys
            | otherwise = ys

-- Q8 list to list of list! important!
groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy' _ [] = []
groupBy' p xs = foldr step [] xs
    where step x [] = [[x]]
          step x ((y:ys):yss)
            | p x y     = (x:y:ys):yss
            | otherwise = [x]:(y:ys):yss

groupBy'' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy'' _ [] = []
gourpBy'' p xs = foldr step [] xs
    where step x [] = [[x]]
          step x (ys@(y:_):yss) -- as pattern
            | p x y     = (x:ys):yss
            | otherwise = [x]:ys:yss

-- \isolate :: [a] -> [[a]]
-- \isolate [] = []
-- \isolate (x:xs) = [x] : isolate xs



