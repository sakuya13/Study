sumList :: Num a => [a] -> a
sumList   [] = 0
sumList (x:xs) = x + sumList xs
-- another ver.
sumList' (x:xs) = x + sumList' xs
sumList' _ = 0
-- be careful! oder of expressions matters!
sumList'' _ = 0
sumList'' (x:xs) = x + sumList'' xs

