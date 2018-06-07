-- concatenate vanishes
-- to deal with the common forms containing reciusion and concatenation:
-- f _ = f _ ++ _
-- rules:
-- 1. [] ++ ys = ys
-- 2. (x:xs) ++ ys = x:(xs ++ ys)
-- 3. (xs ++ ys) ++ zs = xs ++ (ys ++ zs)
-- TODO: the key is to do the right side first, right associative
-- examples 1
-- naive reverse
rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

-- when we see functions like rev, we apply accumulators
-- 1. apply rule 1: rev1 [] ys = [] ++ ys
--       that is:   rev1 [] ys = []
--       and        rev1 (x:xs) = rev' xs ++ ([x] ++ ys)
-- 2. apply rule 2: [x] ++ ys = (x:[]) ++ ys = x:([] ++ ys) = (x:ys)
--               rev1 (x:xs) = rev' xs ++ (x:ys)
-- 3. this is what we want: newf x... ys = oldf x... ++ ys
--    therefore: the form can be replaced as
--    rev1 (x:xs) = rev' xs ++ (x:ys) = rev1 xs (x:ys)
-- 4. rev' xs = rev1 xs []
--    rev1 [] ys = []
--    rev1 (x:xs) = rev1 xs (x:ys)
--
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
cord_to_list1' (Branch a b) rest =
    cord_to_list1' a (cord_to_list1' b rest) -- do the right tree first

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

