-- Q5
xor :: Bool -> Bool -> Bool
xor a b = (a && not b) || (not a && b)

xor' :: Bool -> Bool -> Bool
xor' a b
    | a && not b = True
    | not a && b = True
    | otherwise  = False

xor'' a b = (a || b) && not (a && b)

myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x:_) = Just x

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (_:xs) = Just xs

-- Q6
append :: [a] -> [a] -> [a]
append [] ys     = ys
append (x:xs) ys = x : append xs ys

-- Q7
myReverse :: [a] -> [a]
myReverse zs = myReverse' zs [] 
    where myReverse' [] temp = temp
          myReverse' (x:xs) temp = myReverse' xs (x:temp)

myReverse' :: [a] -> [a]
myReverse' [] = []
myReverse' (x:xs) = myReverse' xs ++ [x]

myReverse'' :: [a] -> [a]
myReverse'' = foldl (flip (:)) []


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
