module Currying where

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a->a) -> a -> a
applyTwice f = f . f

-- If the type declaration of a function says it accepts an a -> b -> c 
-- function as a parameter, it will also accept an a -> a -> a function,
-- but not the other way around! 
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y

-- flip' zip [1,2,3,4,5] "Hello"

