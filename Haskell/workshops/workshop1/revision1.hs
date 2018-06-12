-- Q6
append1 :: [a] -> [a] -> [a]
append1 [] ys = ys
append1 (x:xs) ys = x:append1 xs ys

-- fordr
append2 :: [a] -> [a] -> [a]
append2 xs ys = foldr (:) ys xs


-- Q7
-- ++ vanishing
reverse1 :: [a] -> [a]
reverse1 xs = reverse1' xs []

reverse1' [] acc = acc
reverse1' (x:xs) acc = reverse1' xs (x:acc)

-- foldr
reverse2 :: [a] -> [a]
reverse2 = foldl (flip (:)) []


-- Q8
getNthElem :: Int -> [a] -> a
getNthElem _ [] = error "empty list!"
getNthElem n xs = last $ take n xs


getNthElem1 :: Integer -> [a] -> a
getNthElem1 n [] = error "empty list!"
getNthElem1 n (x:xs)
    | n > 1     = getNthElem1 (n-1) xs
    | n == 1    = x
    | otherwise = error "n is too small!"



