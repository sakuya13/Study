-- Q5
xor :: Bool -> Bool -> Bool
xor a b = (a && not b) || (not a && b)

xor' :: Bool -> Bool -> Bool
xor' a b
    | a && not b = True
    | not a && b = True
    | otherwise  = False

-- Q6
appendList :: (Eq a) => [a] -> [a] -> [a] 
appendList x y
    | null x && null y = []
    | null x           = y
    | null y           = x
    | otherwise        = x ++ y

-- Q7
myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = last xs : myReverse (init xs)

-- Q8
getNthElem :: Int -> [a] -> a
getNthElem _ [] = error "suibaiajfkna"
getNthElem 0 (x:_) = x
getNthElem n (_:xs) = getNthElem (n-1) xs

f1 (x:xs) = head (myReverse (x:xs)) + x
f1 xs@(x:xs') = head (myReverse xs) + x

-- $
f2 xs = head (tail xs)
f2 xs = head $ tail xs
f2 = head . tail
