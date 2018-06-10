-- higher order

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 _ [] = []
filter1 f (x:xs) =
    if f x then x:fxs else fxs
    where fxs = filter f xs

-- filter1 is_even [1,2,3,4]
-- filter1 is_pos [0,-1,1,-2,2]
-- filter1 is_long ["a", "abc", "abcde"]


-- Quiz: will these work?
is_even :: Int -> Bool
is_even x = x `mod` 2 == 0

is_pos :: Int -> Bool
is_pos x = x > 0

is_long :: String -> Bool
is_long x = length x > 3


-- TODO: lambda expressions
-- TODO: the type of lambda expr
-- filter1 (\x -> x `mod` 2 == 0) [1,2,3,4]
-- filter1 (\s -> length s > 3) ["a", "abc", "abcd"]


map1 :: (a -> b) -> [a] -> [b]
map1 _ [] = []
map1 f (x:xs) = (f x):(map f xs)
-- map (*3) [1,2,3] returns [3,6,9]
-- map (5 `mod`) [3,4,5,6,7] returns [2,1,0,5,5]
-- map (`mod` 3) [3,4,5,6,7] returns [0,1,2,0,1]


-- Quiz: is get_names equivalent to get_names1?
-- get_names :: [Customer] -> [String]
-- get_names customers = map customer_name customers
-- customer_name :: Customer -> String
--
-- get_names1 :: [Customer] -> [String]
-- get_names1 = map customer_name
--
-- yes


-- partial application
is_longer :: Int -> String -> Bool
is_longer limit x = length x > limit
-- filter1 (is_longer 4) ["ab", "abc", "abcd"]


-- Quiz: what would this return?
-- filter (<3) [1,2,3,4,5,6,7] returns [1,2]
-- filter (3<) [1,2,3,4,5,6,7] returns [4,5,6,7]


-- currying: p.142 TODO: types
-- is_longer :: Int -> (String -> Bool)
-- is_longer 3 ["a", "ab", "abc", "abcd"]


-- function composition: the basis of monads. TODO: notes their types
-- (f . g) x = f (g x)
-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
min :: (Ord a) => [a] -> a
min = head . sort -- sort included in Data.List
max :: (Ord a) => [a] -> a
max = head . reverse . sort


-- sort :: (Ord a) => [a] -> [a]
-- reverse :: [a] -> [a]
-- head :: [a] -> a
