-- Q1
maybeApply :: (a -> b) -> Maybe a -> Maybe b
maybeApply _ Nothing = Nothing
maybeApply f (Just x) = Just (f x)


-- Q2
zWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zWith _ [] ys = []  
zWith _ xs [] = []
zWith f (x:xs) (y:ys) = (f x y):zWith f xs ys


-- Q3
linearEqn :: Num a => a -> a -> [a] -> [a]
linearEqn a b = map (\x -> a*x+b)


-- Q4 TODO
sqrtPM :: (Floating a, Ord a) => a -> [a]
sqrtPM x
    | x > 0     = let y = sqrt x in [y,-y]
    | x == 0    = [0]
    | otherwise = []

allSqrts :: (Floating a, Ord a) => [a] -> [a] -- to use sqrtPM, must specify
                                              -- its type class constraint here
allSqrts xs = concatMap sqrtPM xs


-- Q5
-- function composition
filter_map :: (Floating a, Ord a) => [a] -> [a]
filter_map = (map sqrt) . (filter (>=0))

-- one traverse
filter_map1 :: (Floating a, Ord a) => [a] -> [a]
filter_map1 = foldr step []
    where 
        step x base = if x >= 0 then (sqrt x):base
                      else base


