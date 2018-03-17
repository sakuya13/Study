import Data.Char (digitToInt)

asInt :: String -> Int
asInt xs = loop 0 xs

loop :: Int -> String -> Int
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                  in loop acc' xs

-- tail recursion
mySum xs = helper 0 xs
    where helper acc (x:xs) = helper (acc + x) xs
          helper acc [] = acc

-- foldl definition
foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' step zero (x:xs) = foldl' step (step zero x) xs
foldl' _ zero [] = zero

foldlSum :: [Integer] -> Integer
foldlSum xs = foldl (+) 0 xs

