-- Q1
maybeApply :: (a -> b) -> Maybe a -> Maybe b
maybeApply _ Nothing = Nothing
maybeApply f (Just something) = Just $ f something

-- Q2
zWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zWith f [] _ = []
zWith f _ [] = []
zWith f (x:xs) (y:ys) = f x y : zWith f xs ys

-- Q3
linearEqn :: Num a => a -> a -> [a] -> [a]
linearEqn _ _ [] = []
linearEqn n m (x:xs) = (x*n+m) : linearEqn n m xs

-- Q3 ver2: lambda
linearEqn' :: Num a => a -> a -> [a] -> [a]
linearEqn' n m = map (\x -> n*x + m)

-- Q4

sqrtPM x
    | x >  0    = let y = sqrt x in [y,-y]
    | x == 0    = [0]
    | otherwise = []

allSqrt :: (Floating a, Ord a) => [a] -> [a]
allSqrt [] = []
allSqrt (x:xs) = (sqrtPM x) ++ allSqrt xs

-- Q4 ver2
allSqrt' :: (Floating a, Ord a) => [a] -> [a]
allSqrt' = foldr sqrtPM' []
    where sqrtPM' x ys
            | x >  0    = let y = sqrt x in [y,-y] ++ ys
            | x == 0    = [0] ++ ys
            | otherwise = [] ++ ys

-- Q4 ver3
allSqrt'' :: (Floating a, Ord a) => [a] -> [a]
allSqrt'' xs = foldl (++) [] (map sqrtPM xs) 

-- Q4 ver4
allSqrt''' :: (Floating a, Ord a) => [a] -> [a]
allSqrt''' = concatMap sqrtPM

-- Q5
-- (a)
safeSqrt :: (Floating a, Ord a) => [a] -> [a]
safeSqrt = (map sqrt) . (filter (>0))

-- (b)
safeSqrt' :: (Floating a, Ord a) => [a] -> [a]
safeSqrt' [] = []
safeSqrt' (x:xs)
    | x > 0     = (sqrt x) : safeSqrt' xs
    | otherwise = safeSqrt' xs

-- (c)
safeSqrt'' :: (Floating a, Ord a) => [a] -> [a]
safeSqrt'' = foldr step []
    where step x xs
            | x > 0     = (sqrt x) : xs
            | otherwise = xs

