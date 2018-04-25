-- Sum the numbers between two inclusive values recursively, assuming a < b when 
-- the function is first called
sumInts :: Int -> Int -> Int
sumInts a b = sum [a..b]

sumInts' :: Int -> Int -> Int
sumInts' a b
    | a > b     = 0
    | otherwise = a + sumInts' (a+1) b


-- define a square function
sq :: Int -> Int
sq n = n^2

-- Sum the squares between two numbers. This function should be similar 
-- to the sumInts function
sumSquares :: Int -> Int -> Int
sumSquares a b = (sum . (map sq)) [a..b]

-- higher order sum
higherOrderSum :: (Int -> Int) -> Int -> Int -> Int
higherOrderSum f a b = sum $ map f [a..b]


higherOrderSum' :: (Int -> Int) -> Int -> Int -> Int
higherOrderSum' f a b = foldr ((+) . f) 0 [a..b]

--This is wrong!:
--  higherOrderSum'' f a b = foldl ((+) . f) 0 [a..b]

hoSumSquares :: Int -> Int -> Int
hoSumSquares a b = foldr ((+) . (^2)) 0 [a..b]

hoSumInts :: Int -> Int -> Int
hoSumInts a b = foldl (+) 0 [a..b]


-- `dropWhileEnd p xs`
-- `dropWhileEnd isSpace " abc  def  " ==> " abc  def"
dropWhileEnd :: (a -> Bool) -> [a] -> [a]
dropWhileEnd = undefined
