-- Q4
mysum :: Num a => [a] -> a
mysum = foldl (+) 0

myproduct :: Num a => [a] -> a
myproduct = foldl (*) 1


-- Q5
filter_map :: (a -> Maybe b) -> [a] -> [b]
filter_map _ [] = []
filter_map f (x:xs) =
    case f x of
        Nothing -> filter_map f xs
        Just y  -> y:filter_map f xs


filter_map1 :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filter_map1 _ _ [] = []
filter_map1 p f (x:xs)
    | p x       = (f x):filter_map1 p f xs
    | otherwise = filter_map1 p f xs

-- one_pass xs = filter_map1 is_even triple xs
-- two_pass xs = map triple (filter is_even xs)


-- Q6
-- all_pos, some_not_pos, length
all_pos :: (Ord a, Num a) => [a] -> Bool
all_pos = all (>0)

some_not_pos :: (Ord a, Num a) => [a] -> Bool
some_not_pos = any (<0)

length1 :: [a] -> Int
length1 = foldr ((+).(const 1)) 0


-- Q7
-- filter and map using foldr
filter1 :: (a -> Bool) -> [a] -> [a]
filter1 f [] = []
filter1 f (x:xs) =
    if f x then x:filter1 f xs
    else filter1 f xs

filter2 :: (a -> Bool) -> [a] -> [a]
filter2 f = foldr fxs []
    where fxs x base = if f x then x:base else base

map1 :: (a -> b) -> [a] -> [b]
map1 _ [] = []
map1 f (x:xs) = (f x):map1 f xs

map2 :: (a -> b) -> [a] -> [b]
map2 f = foldr fxs []
    where fxs x base = (f x):base

-- Q8 



