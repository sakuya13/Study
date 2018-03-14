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

