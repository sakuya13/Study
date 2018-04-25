import Data.List
import Data.Char (toLower)
---------------------------------------------------
-- lists
---------------------------------------------------
--
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
elementAt :: [a] -> Int -> a
--elementAt [] _ = error "no element"
elementAt xs n 
    | n > 0 && n <= (length xs) = last $ take n xs
    | otherwise = error "out of index range"


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


-- P9: pack consecutive duplicates of list elements into sublists.
-- If a list contains repeated elements they should be placed in
-- separate sublists.
--pack :: (Eq a) => [a] -> [[a]]
--pack [x] = [[x]]
----pack xs = (x:first):pack rest
--pack (x:ys@(y:_))
--    | x == y    = [x,y]:pack ys
--    | otherwise = pack ys
-- this is implemented as group in prelude
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack xs@(x:_) = first : pack rest
    where (first,rest) = span (==x) xs


-- P10 (*) Run-length encoding of a list.
encode :: (Eq a) => [a] -> [(Int,a)]
encode [] = []
encode xs@(x:_) = (n,e) : encode rest
    where (first,rest) = span (==x) xs
          n = length first
          e = x

-- using lambda, point free style, must use type signiture
encode' :: (Eq a) => [a] -> [(Int,a)]
encode' = map (\x -> (length x, head x)) . group

-- using list comprehension
encode'' xs = [ (length x, head x) | x <- group xs ]


-- p11 (*) Modified run-length encoding
data Items a = Single a | Multiple Int a
               deriving Show


encodeModified :: (Eq a) => [a] -> [Items a]
encodeModified [] = []
encodeModified xs@(x:_)
    | n == 1    = Single x : encodeModified rest
    | otherwise = Multiple n x : encodeModified rest
    where (first,rest) = span (==x) xs
          n = length first

encodeModified' :: (Eq a) => [a] -> [Items a]
encodeModified' = 
    (map (\ys -> case ys of
                    [y] -> Single y
                    _   -> Multiple (length ys) (head ys)
         ) ) . group


-- cat comes in!!!
catSays :: IO ()
catSays = do
    who <- getLine
    case map toLower who of
        "cat" -> putStrLn $ who ++ " is cute!"
        _     -> do 
                    putStrLn $ who ++ " is fat"
                    putStrLn $ "beat " ++ who ++ "!"


-- P12 (**) Decode a run-length encoded list.
decodeModified :: [Items a] -> [a]
decodeModified [] = []
decodeModified ((Single x):ys) = x : decodeModified ys
decodeModified ((Multiple n x):ys) = replicate n x ++ decodeModified ys

-- using concatMap :: Foldable t => (a -> [b]) -> t a -> [b]
decodeModified' :: [Items a] -> [a]
decodeModified' = concatMap helper
    where helper (Single x) = [x]
          helper (Multiple n x) = replicate n x


-- p13 


-- p14 (*) Duplicate the elements of a list.
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = x:x:dupli xs

dupli' :: [a] -> [a]
dupli' list = concat [ [x,x] | x <- list ]

dupli'' :: [a] -> [a]
dupli'' = concatMap (\x -> [x,x])


-- p15 (**) Replicate the elements of a list a given number of times.
repli :: [a] -> Int -> [a]
repli xs n = concatMap (replicate n) xs

-- pointfree
repli' :: [a] -> Int -> [a]
repli' = flip $ concatMap . replicate
--repli' = concatMap . (flip replicate)


-- p16 (**) Drop every N'th element from a list.
dropEvery :: (Eq a) => [a] -> Int -> [a]
dropEvery list n = list \\ (dropEvery' list n 1)
    where dropEvery' (x:xs) n count 
            | count `mod` n == 0 = x:dropEvery' xs n (count+1)
            | otherwise          = dropEvery' xs n (count+1)
          dropEvery' [] _ _ = []


-- p17 (*) Split a list into two parts; the length of the first part is given.
split :: [a] -> Int -> ([a],[a])
split [] _ = ([],[])
split xs n = (take n xs, drop n xs)

split' :: (Eq a) => [a] -> Int -> ([a],[a])
split' [] _ = ([],[])
split' list n = helper list n 1
    where helper (x:xs) n count
--            | count >= length list     = [list,[]]
            | count == n+1             = result
            | otherwise                = helper xs n (count+1)
            where result = break (==x) list
          helper [] _ _ = ([],[])

-- general approach to solve this kind of problems
split'' :: (Eq a) => [a] -> Int -> ([a],[a])
split'' [] _ = ([],[])
split'' l@(x:xs) n
    | n > 0     = (x:ys,zs)
    | otherwise = ([],l)
    where (ys,zs) = split'' xs (n-1)


-- p18 (**) Extract a slice from a list.
slice :: [a] -> Int -> Int -> [a]
slice list m n = drop (m-1) $ take n list


-- p19 (**) Rotate a list N places to the left.
rotate :: [a] -> Int -> [a]
rotate list n
    | n <  0     = drop (l+n) list ++ take (l+n) list
    | otherwise  = drop n list ++ take n list
    where l = length list


-- p20 (*) Remove the K'th element from a list.
removeAt :: (Eq a) => Int -> [a] -> (a,[a])
removeAt n list = 
    case result of
        Just a  -> a
        Nothing -> error "Wrong input"
    where result = removeAt' n list

removeAt' _ [] = Nothing
removeAt' n list =
    if n <= length list && n > 0 
    then let target = last $ take n list
         in Just (target, list \\ [target])
    else Nothing

removeAt'' :: Eq a => Int -> [a] -> Either String (a,[a])
removeAt'' _ [] = Left "empty list"
removeAt'' n list =
    if n <= length list && n > 0
    then let target = last $ take n list
         in Right (target, list \\ [target])
    else Left "index out of range"

--Left err -> error $ show err
--
--Data Error = Error ErrorPosition, ErrorMsg, ..
--instance Show Error where
--    show (Error pos msg) = show msg ++ " at " ++ show pos

removeAt''' :: Int -> [a] -> (a,[a])
removeAt''' k xs = 
    case back of
        []     -> error "removeAt: index too large"
        x:rest -> (x, front ++ rest)
    where (front, back) = splitAt (k-1) xs


-- p21 Insert an element at a given position into a list.
insertAt :: a -> [a] -> Int -> [a]
insertAt elt list k =
    case back of
        []     -> error "insertAt: index too large"
        (x:_)  -> front ++ elt:back
    where (front, back) = splitAt (k-1) list

-- recursion
insertAt' :: a -> [a] -> Int -> [a]
insertAt' x ys 1 = x:ys
insertAt' x (y:ys) k = y:insertAt' x ys (k-1)


-- p22 Create a list containing all integers within a given range.
range :: Int -> Int -> [Int]
range m n
    | m >  n     = m:range (m-1) n
    | m == n     = [m]
    | otherwise  = m:range (m+1) n

range' m n = [m..n]


-----------------------------------------------
-- Arithmetic
-----------------------------------------------
-- p31 (**) Determine whether a given integer number is prime.
isPrime :: Int -> Maybe Bool
isPrime n = if n > 1 
            then Just $ not $ n `elem` testList
            else Nothing
            where range = [1..n-1]
                  testList = [ x*y | x <- range,y <- range ]


-----------------------------------------------
-- Binary tree
-----------------------------------------------
-- Data structure of binary tree
data Tree a = Empty | Node a (Tree a) (Tree a)
              deriving (Show, Eq)

-- instances
tree1 = Node 'a' (Node 'b' (Node 'd' Empty Empty) 
                               (Node 'e' Empty Empty))
                   (Node 'c' Empty 
                               (Node 'f' (Node 'g' Empty Empty) 
                                            Empty))
-- define the leaf
leaf :: a -> Tree a
leaf x = Node x Empty Empty

tree1' = Node 'a' (Node 'b' (leaf 'd')
                                (leaf 'e'))
                    (Node 'c' Empty
                                (Node 'f' (leaf 'g')
                                             Empty))

-- tree with one node only
tree2 = Node 'a' Empty Empty

-- empty tree
tree3 = Empty

-- a tree of integers
tree4 = Node 1 (Node 2 Empty (Node 4 Empty Empty))
                 (Node 2 Empty Empty)

tree4' = Node 1 (Node 2 Empty (leaf 4))
                  (leaf 2)


-- p54A (*) Check whether a given term represents a binary tree
























