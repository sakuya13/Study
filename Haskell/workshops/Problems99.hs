-- P1: find the last element of a list
myLast :: [a] -> a
myLast [] = error "empty list"
myLast [x] = x
myLast (_:xs) = myLast xs

myLast' = head . reverse

myLast'' :: [a] -> a
myLast'' = foldr1 (const id)

myLast''' :: Foldable t => t a -> a
myLast''' = foldr1 (flip const)

myLast'''' :: Foldable t => t a -> a
myLast'''' = foldl1 (const id)

-- myLast'' = foldr1 (const id)

-- P2: find the last but one element of a list
myButLast :: [a] -> a
myButLast [] = error "empty list"
myButLast (x:y:[]) = x
myButLast (x:y:ys) = myButLast (y:ys)

myButLast' [x,_] = x
myButLast' (_:xs) = myButLast' xs

myButLast'' = last . init

myButLast''' =  head . tail . reverse

myButLast'''' = head . reverse . init

-- P3: find the K'th element of a list, the first element is number 1.


-- P4: find the number of element of a list (length).
myLength :: [a] -> Int
myLength = foldr ((+) . const 1) 0

-- P5: reverse a list.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myReverse' :: [a] -> [a]
myReverse' [] = []
myReverse' (x:xs) = myReverse' xs ++ [x]

myReverse'' :: [a] -> [a]
myReverse'' xs = foldr (\x fId empty -> fId (x : empty)) id xs []

-- P6: whether is palindrome.
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- P7:Transform a list, possibly holding lists as elements 
-- into a `flat' list by replacing each list with its elements (recursively). 
data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List []) = []

-- P8: (**) Eliminate consecutive duplicates of list elements.
compress :: (Eq a) => [a] -> [a]
compress [x] = [x]
compress (x:ys@(y:_))
    | x == y    = compress (ys)
    | otherwise = [x] ++ compress (ys)
















