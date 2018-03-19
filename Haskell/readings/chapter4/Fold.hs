import Data.Char (digitToInt)

s = sum [1..100000]

asInt :: String -> Int
asInt xs = loop 0 xs

loop :: Int -> String -> Int
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                  in loop acc' xs

-- tail recursion
mySum = helper 0
    where helper acc (x:xs) = helper (acc + x) xs
          helper acc [] = acc

-- foldl definition
foldL :: (a -> b -> a) -> a -> [b] -> a
foldL step zero (x:xs) = foldL step (step zero x) xs
foldL _ zero [] = zero

--foldlSum :: [Integer] -> Integer
foldlSum xs = foldl (+) 0 xs

-- foldr definition
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ zero [] = zero
foldr' step zero (x:xs) = step x (foldr' step zero xs)

foldrSum :: [Integer] -> Integer
foldrSum xs = foldr (+) 0 xs

myfilter :: (a -> Bool) -> [a] -> [a]
myfilter _ [] = []
myfilter f (x:xs)
    | f x       = x : myfilter f xs
    | otherwise = myfilter f xs

foldrFilter :: (a -> Bool) -> [a] -> [a]
foldrFilter f xs = foldr step [] xs
    where step x ys | f x       = x : ys
                    | otherwise = ys

myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldr step [] xs
    where step x ys = f x : ys

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f z xs = foldr step id xs z
    where step x g a = g (f a x)

identity :: [a] -> [a]
identity xs = foldr (:) [] xs

append :: [a] -> [a] -> [a]
append xs ys = foldr (:) ys xs


