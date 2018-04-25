maybeApply :: (a -> b) -> Maybe a -> Maybe b
maybeApply _ Nothing = Nothing
maybeApply f (Just something) = Just (f something)

zWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zWith _ [] _ = []
zWith _ _ [] = []
zWith f (x:xs) (y:ys) = f x y : zWith f xs ys

linearEqn :: Num a => a -> a -> [a] -> [a]
linearEqn m n = foldr ((:) . (\x -> x*m+n)) []

linearEqn' :: Num a => a -> a -> [a] -> [a]
linearEqn' m n = map (\x -> x*m+n)

sqrtPM :: (Floating a, Ord a) => a -> [a]
sqrtPM x
    | x > 0     = let y = sqrt x in [y,-y]
    | x == 0    = [0]
    | otherwise = []

allSqrts :: (Floating a, Ord a) => [a] -> [a]
allSqrts = foldr ((++) . sqrtPM) []

allSqrts' :: (Floating a, Ord a) => [a] -> [a]
allSqrts' xs = foldl (++) [] (map sqrtPM xs)

allSqrts'' :: (Floating a, Ord a) => [a] -> [a]
allSqrts'' = concatMap sqrtPM

-- wrong ver, extra 0's inside the output list
safeSqrt :: (Ord a, Floating a) => [a] -> [a]
safeSqrt = foldr ((:) . (sqrt . (\x -> if x >= 0 then x else 0))) []

safeSqrt' :: (Ord a, Floating a) => [a] -> [a]
safeSqrt' = (map sqrt) . (filter (>=0))

oneTraverseSqrt :: (Ord a, Floating a) => [a] -> [a]
oneTraverseSqrt [] = []
oneTraverseSqrt (x:xs) =
    if x >= 0 then sqrt x : oneTraverseSqrt xs
    else oneTraverseSqrt xs

sss xs = foldr f [] xs
    where f x acc = if x >= 0 then (sqrt x):acc else acc

