insertInt :: Int -> [Int] -> [Int]
insertInt elt [] = [elt]
insertInt elt (x:xs)
    | elt <= x  = elt:x:xs
    | otherwise = x : insertInt elt xs

-- polymorphic version
insertInt' :: (Ord t) => t -> [t] -> [t]
insertInt' elt [] = [elt]
insertInt' elt (x:xs)
    | elt <= x  = elt:x:xs
    | otherwise = x : insertInt' elt xs

filterNegative :: [Int] -> [Int]
filterNegative [] = []
filterNegative (x:xs)
    | x < 0     = filterNegative xs
    | otherwise = x : filterNegative xs


