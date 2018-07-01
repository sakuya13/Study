-- Q1
sumsq :: Int -> Int
sumsq n = foldr ((+).(^2)) 0 [1..n]


-- Q2
length1 :: [a] -> Integer
length1 = foldr ((+).(const 1)) 0

length2 :: [a] -> Integer
length2 = foldl (flip ((+).const 1)) 0


-- Q3
minilist :: [Int] -> Int
minilist = foldr1 step
    where step a b = if a <= b then a else b

minilist1 :: [Int] -> Int 
minilist1 = foldl1 step
    where step a b = if a <= b then a else b
   

-- Q4
rev1 :: [a] -> [a]
rev1 = foldl (flip (:)) []

rev2 :: [a] -> [a]
rev2 = foldr step []
    where step x base = base ++ [x]


-- Q5
remove :: String -> String -> String
remove s1 s2 = foldr step [] s2
    where
        step x base = if x `elem` s1 then base
                      else x:base


-- Q6
filter1 :: (a -> Bool) -> [a] -> [a]
filter1 p = foldr step []
    where step x base = if p x then x:base else base

filter2 :: (a -> Bool) -> [a] -> [a]
filter2 p = foldl step []
    where step base x = if p x then x:base else base


-- Q7
remdups :: (Eq a) => [a] -> [a]
remdups = foldr step []
    where 
        step x [] = [x]
        step x (y:base) = if x == y then y:base
                          else x:y:base


-- Q8
inits :: String -> [String]
inits = foldr step [[]]
    where step x base = []:map (x:) base

inits1 :: [a] -> [[a]]
inits1 [] = [[]]
inits1 (x:xs) = (x:xs):inits1 xs




