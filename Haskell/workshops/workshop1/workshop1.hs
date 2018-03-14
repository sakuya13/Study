-- Q5
xor :: Bool -> Bool -> Bool
xor a b = (a && not b) || (not a && b)

xor' :: Bool -> Bool -> Bool
xor' a b
    | a && not b = True
    | not a && b = True
    | otherwise  = False

-- Q6
append :: [a] -> [a] -> [a]
append [] y     = y
append (x:xs) y = x : append xs y

-- Q7
myReverse :: [a] -> [a]
myReverse zs = myReverse' zs [] 

myReverse' :: [a] -> [a] -> [a]
myReverse' [] temp = temp
myReverse' (x:xs) temp = myReverse' xs (x:temp)

-- Q8
getNthElem :: Int -> [a] -> a
getNthElem _ [] = error "suibaiajfkna"
getNthElem 0 (x:_) = x
getNthElem n (_:xs) = getNthElem (n-1) xs

-- additional notes
 --f1 (x:xs) = head (myReverse (x:xs)) + x
 --f1 xs@(x:xs') = head (myReverse xs) + x

-- $
 --f2 xs = head (tail xs)
 --f2 xs = head $ tail xs
 --f2 = head . tail
