-- Q2
type Size = Integer
type Face = String

data Colour = ColourName String | Hex String | Rgb Int Int Int 
data Font = Font Size Face Colour

-- Q3
factorial :: Integer -> Integer
factorial n
    | n == 0    = 1
    | otherwise = n * factorial (n-1)

-- Q4
myElem :: (Eq t) => t -> [t] -> Bool
myElem a [] = False
myElem a (x:xs)
    | a == x    = True
    | otherwise = myElem a xs

-- Q5
longestPrefix :: (Eq t) => [t] -> [t] -> [t]
longestPrefix [] _ = []
longestPrefix _ [] = []
longestPrefix (x:xs) (y:ys)
    | x == y    = x : longestPrefix xs ys
    | otherwise = []

-- Q6
mccarthy_91 :: Int -> Int
mccarthy_91 n = mccarthy_91' n 1 

mccarthy_91' :: Int -> Int -> Int
mccarthy_91' n c =
    if c /= 0
    then 
        if n > 100
        then mccarthy_91' (n-10) (c-1)
        else mccarthy_91' (n+11) (c+1)
    else n

-- Q7
buildList :: Int -> Int -> [Int]
buildList min max
    | max < min  = error "Max is smaller than Min!"
    | max == min = [max]
    | otherwise = min : buildList (min+1) max


