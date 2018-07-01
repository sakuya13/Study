-- Q2
-- the inferred type is ftoc :: Fractional a => a -> a
ftoc :: Double -> Double
ftoc f = (5/9)*(f-32)

-- Q3 TODO


-- Q4
merge_sorted :: Ord a => [a] -> [a] -> [a]
merge_sorted [] ys = ys
merge_sorted xs [] = xs
merge_sorted l1@(x:xs) l2@(y:ys)
    | x <= y    = x:merge_sorted xs l2
    | otherwise = y:merge_sorted ys l1


-- Q5
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = (quicksort left) ++ [x] ++ (quicksort right)
    where 
        left  = [ y | y <- xs, y < x]
        right = [ z | z <- xs, z >=  x]


-- slightly better ver
quicksort1 :: Ord a => [a] -> [a]
quicksort1 xs = quicksort1' xs []

quicksort1' [] acc = acc
quicksort1' (x:xs) acc = 
    quicksort1' left $ x:quicksort1' right acc
    where
        (left,right) = foldr step ([],[]) xs
        step y (accl,accr) = if y < x then (y:accl,accr)
                             else (accl,y:accr)
--        left  = [ y | y <- xs, y < x]
--        right = [ z | z <- xs, z >=  x]
       

-- Q6
data Tree k v = Leaf | Node k v (Tree k v) (Tree k v)
        deriving (Eq, Show)

same_shape :: Tree a b -> Tree c d -> Bool
same_shape Leaf Leaf = True
same_shape (Node k1 v1 l r) (Node k2 v2 l' r') =
    same_shape l l' && same_shape r r'
same_shape _ _ = False


-- Q7
data Expression
    = Var Variable
    | Num Integer
    | Plus Expression Expression
    | Minus Expression Expression
    | Times Expression Expression
    | Div Expression Expression

data Variable = A | B


eval :: Integer -> Integer -> Expression -> Integer
eval a b expr = 
    case expr of 
        Var A   -> a
        Var B   -> b
        Num i   -> i
        Plus e1 e2 -> (eval a b e1) + (eval a b e2)
        Minus e1 e2 -> (eval a b e1) - (eval a b e2)
        Times e1 e2 -> (eval a b e1) * (eval a b e2)
        Div e1 e2 -> (eval a b e1) `div` (eval a b e2)

-- TODO:
-- (/) :: Fractional a => a -> a -> a
-- div :: Integral a => a -> a -> a     -- use this on Integer input
-- 

        
