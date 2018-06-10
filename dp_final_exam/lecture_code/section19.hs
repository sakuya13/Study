import Data.List
-- --------------------concatenate vanishes----------------------------
-- to deal with the common forms containing reciusion and concatenation:
-- f _ = f _ ++ _
-- rules:
-- 1. [] ++ ys = ys
-- 2. (x:xs) ++ ys = x:(xs ++ ys)
-- 3. (xs ++ ys) ++ zs = xs ++ (ys ++ zs)
-- (*) (f x_1...x_n) ++ y = f' x_1 ... x_n y
-- TODO: the key is to do the right side first, right associative
-- examples 1
-- naive reverse
-- reverse :: [a] -> [a]
-- reverse [] = []
-- reverse (x:xs) = reverse xs ++ [x]

-- when we see functions like rev, we apply accumulators
-- 
-- reverse' [] ys = [] ++ ys
-- reverse' (x:xs) ys = (reverse xs ++ [x]) ++ ys
--
-- apply rule 1: [] ++ ys = ys
-- apply rule 3: (reverse xs ++ [x]) ++ ys = reverse xs ++ ([x] ++ ys)
-- apply rule 2:                       = reverse xs ++ (x:([] ++ ys))
-- apply rule 1:                       = reverse xs ++ (x:ys)
-- apply (*)   :                       = reverse' xs (x:ys) 
-- finally     : reverse xs = reverse' xs []
--               reverse' [] ys = ys
--               reverse' (x:xs) ys = reverse' xs (x:ys)
-- --------------------------------------------------------------------
-- optimised ver.
rev' :: [a] -> [a]
rev' xs = rev1 xs []

rev1 :: [a] -> [a] -> [a]
rev1 [] ys = ys
rev1 (x:xs) ys = rev1 xs (x:ys)

-- example 2
-- concate all suffixes of a list
-- naive ver.
suffixes :: [a] -> [a]
suffixes [] = []
suffixes (x:xs) = suffixes xs ++ (x:xs)

suffixes1 :: [a] -> [a]
suffixes1 xs = suf xs []

suf [] ys = ys
suf (x:xs) ys = suf xs ((x:xs) ++ ys)


-- example 3
-- also is an example of deforestation
-- converting cords to lists
data Cord a = Nil | Leaf a | Branch (Cord a) (Cord a)
-- naive ver.
cord_to_list :: Cord a -> [a]
cord_to_list Nil = []
cord_to_list (Leaf x) = [x]
cord_to_list (Branch a b) =
    (cord_to_list a) ++ (cord_to_list b)


-- optimised ver.
cord_to_list1 :: Cord a -> [a]
cord_to_list1 c = cord_to_list1' c []

cord_to_list1' :: Cord a -> [a] -> [a]
cord_to_list1' Nil rest = rest
cord_to_list1' (Leaf x) rest = x:rest
cord_to_list1' (Branch l r) rest =
    cord_to_list1' l $ cord_to_list1' r rest -- do the right tree first

-- example 4
-- naive iota
iota :: Int -> [Int]
iota n = 
    if n == 0 
    then [] 
    else iota (n-1) ++ [n]

iota1 :: Int -> [Int]
iota1 n = iota1' n []

iota1' :: Int -> [Int] -> [Int]
iota1' 0 acc = acc
iota1' n acc = iota1' (n-1) (n:acc)




-- second example of deforestation
filter_map1 :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filter_map1 _ _ [] = []
filter_map1 p f (x:xs)
    | p x       = (f x):filter_map1 p f xs
    | otherwise = filter_map1 p f xs

-- one_pass xs = filter_map1 is_even triple xs
-- two_pass xs = map triple (filter is_even xs)


-- third example of deforestation
four_pass_stddev :: [Double] -> Double
four_pass_stddev xs =
    let 
        count = fromIntegral (length xs)
        sum = foldl' (+) 0 xs
        sumsq = foldl' (+) 0 (map square xs)
    in
        (sqrt (count * sumsq - sum * sum )) / count
square :: Double -> Double 
square x = x*x

-- optimised ver.
data StddevData = SD !Double !Double !Double
one_pass_stddev xs =
    let 
        init_SD = SD 0.0 0.0 0.0
        update_SD (SD c s sq) x = SD (c + 1.0) (s + x) (sq + x*x)
        SD count sum sumsq = foldl' update_SD init_SD xs
    in
        (sqrt (count * sumsq - sum * sum )) / count
       

one_pass_stddev1 xs =
    let 
        init_SD = (0.0, 0.0, 0.0)
        update_SD (c, s, sq) x = ((c + 1.0), (s + x), (sq + x*x))
        (count, sum, sumsq) = foldl' update_SD init_SD xs
    in
        (sqrt (count * sumsq - sum * sum )) / count

main = print $ four_pass_stddev [1..10000000]



-- check sortedness
-- naive ver.
sorted1 :: Ord a => [a] -> Bool
sorted1 [] = True
sorted1 [_] = True
sorted1 (x1:x2:xs) = x1 <= x2 && sorted1 (x2:xs)

-- optimised ver.
sorted2 :: Ord a => [a] -> Bool
sorted2 [] = True
sorted2 (x:xs) = sorted2' x xs

sorted2' :: Ord a => a -> [a] -> Bool
sorted2' _ [] = True
sorted2' x1 (x2:xs) = x1 <= x2 && sorted2' x2 xs


