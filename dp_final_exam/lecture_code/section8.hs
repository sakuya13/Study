-- folds
-- 
-- foldl' :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- foldl' _ base [] = base
-- foldl' f base (x:xs) =
--     let newbase = f base x in
--     foldl' f newbase xs
-- 
-- suml :: [Integer] -> Integer
-- suml = foldl' (+) 0
-- 
-- productl :: [Integer] -> Integer
-- productl = foldl' (*) 1
-- 
-- concatl :: [[a]] -> [a]
-- concatl = foldl' (++) []
-- 
-- 
-- foldr' :: Foldable t => (a -> b -> b) -> b -> t a -> b
-- foldr' _ base [] = base
-- foldr' f base (x:xs) =
--     let fxs = foldr' f base xs in
--     f x fxs
-- 
-- sumr = foldr' (+) 0
-- productr = foldr' (*) 1
-- concatr = foldr' (++) []


-- TODO: splitAt :: Int -> [a] -> ([a], [a])
-- splitAt n l returns a pair of the first n elements of l and the rest of l
-- splitAt 5 [1..10] returns ([1,2,3,4,5],[6,7,8,9,10])


-- Quiz: rewrite the hypotenuse function in point-free style
-- square x = x ^ 2
-- hypotenuse sides = sqrt (sum (map square sides))
hypotenuse :: [Double] -> Double
hypotenuse = sqrt . sum . (map (^2))


-- foldl1 :: Foldable t => (a -> a -> a) -> [a] -> a
-- foldr1 :: Foldable t => (a -> a -> a) -> [a] -> a
maximum :: (Ord a) => [a] -> a
maximum = foldr1 max
minimum :: (Ord a) => [a] -> a
minimum = foldr1 min
-- max :: Ord a => a -> a -> a
-- min :: Ord a => a -> a -> a

-- powerful use of Folds

-- const :: a -> b -> a
-- const a b = a
length1 :: [a] -> Integer
length1 = foldr ((+) . const 1) 0

map' :: (a -> b) -> [a] -> [b]
map' f = foldr ((:) . f) []


-- reverse using foldl
snoc :: [a] -> a -> [a]
snoc tl hd = hd:tl

reverse1 :: [a] -> [a]
reverse1 = foldl snoc []


-- flip :: (a -> b -> c) -> (b -> a -> c)
-- flip f x y = f y x
reverse2 :: [a] -> [a]
reverse2 = foldl (flip (:)) []



-- list comprehension
-- quicksort
qs1 [] = []
qs1 (x:xs) = qs1 littles ++ [x] ++ qs1 bigs
    where 
        littles = filter (<x) xs
        bigs    = filter (>=x) xs

qs2 [] = [] 
qs2 (x:xs) = qs2 littles ++ [x] ++ qs2 bigs
    where
        littles = [l | l <- xs, l < x]
        bigs    = [b | b <- xs, b >= x]

-- [template | var <- list, var <- list, ... , boolean exprs, boolean exprs, ...]
-- also may use zero or more let exprs to define local variables
columns = "abcdefgh"
rows    = "12345678"
chess_squares = [[c,r] | c <- columns, r <- rows]

pairs = [(a,b) | a <- [1,2,3], b <- [1,2,3]]
nums = [10*a+b | a <- [1,2,3], b <- [1,2,3]]

-- TODO: HTML data structure

-- Quiz: type of the following?
-- map :: (a -> b) -> [a] -> [b]
-- (+1) :: (Num a) => a -> a
-- map (+1) :: (Num a) => [a] -> [a]



-- TODO: other useful higher order functions (from section 16)
-- any :: (a -> Bool) -> [a] -> Bool
-- all :: (a -> Bool) -> [a] -> Bool
-- all (elem 'e') ["eclectric", "elephant", "legion"]
-- any (\x -> elem x "aeiou") "sky"
-- any (flip elem "aeiou") "hmmmm"

