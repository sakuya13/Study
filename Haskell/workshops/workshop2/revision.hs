-- Q2
data Font_colour
    = Colour_name String
    | Hex Int
    | RGB Int Int Int

data Font_tag
    = Font_tag (Maybe Int) (Maybe String) (Maybe Font_colour)


-- Q3
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)


-- Q4 TODO
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem x (y:ys) = x == y || (myElem x ys)

myElem1 :: Eq a => a -> [a] -> Bool
myElem1 x = any (==x)


-- Q5
longestPrefix :: Eq a => [a] -> [a] -> [a]
longestPrefix [] ys = ys
longestPrefix xs [] = xs
longestPrefix (x:xs) (y:ys)
    | x == y    = x:longestPrefix xs ys
    | otherwise = []


-- Q6


-- Q7 TODO
range :: Int -> Int -> [Int]
range min max
    | max >= min = min:range (min+1) max
    | otherwise  = []


range1 :: Int -> Int -> [Int]
range1 min max
    | max >= min = (range min (max-1)) ++ [max]
    | otherwise  = []



