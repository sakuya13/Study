-- Q1
-- (a): (<) :: Ord a => a -> a -> Bool
--
-- (b): map (+3) :: Num a => [a] -> [a]
--
-- (c): foldr :: Foldable t => (a -> b -> b) ->  b -> t a -> b
--
-- (d): Nothing :: Maybe a
--
-- (e): TODO: zip [True,True,False] :: [a] -> [(Bool,a)]
--
-- (f): TODO: flip filter "hello" :: (Char -> Bool) -> [Char]
--
-- TODO: basic tpyes like Bool, Char, Maybe a, Either a b, Ordering, String
-- are not type classes. so dont use e.g. (Char a) => a -> a in type signitures
--
--
-- Q2
-- (a): type error. length :: Foldable t => t a -> Int, it takes only one
--      arguement, that is t a. (<) is a function, (<) :: Ord a -> a -> a -> Bool
--      thus it triggers a type error.
--
-- (b): [1,2]
--
-- (c): TODO: 3 -- lazy evaluation?
--      wrong: exeception: empty list.
--      because head only applies to non-empty list
--
-- (d): ['a','b','d'] or "abd" TODO: better write "abd" directly as in ghci
--
-- (e): [(0,0)]
--
-- (f): [3,1,2,4]
--
-- 
-- Q3:
data Ttree t = Nil | Node3 t (Ttree t) (Ttree t) (Ttree t)


flatten_tree :: Ttree Double -> Double
flatten_tree ttree = (sum / count)
  where
    (sum,count) = flatten_tree1 ttree (0.0,0.0)

flatten_tree1 :: Ttree Double -> (Double,Double) -> (Double,Double)
flatten_tree1 Nil acc = acc
flatten_tree1 (Node3 n l m r) acc = (sum,count)
  where
    sum = sum' + n
    count = count' + 1.0
    (sum',count') =  -- right associative is the key
      flatten_tree1 l $ flatten_tree1 m $ flatten_tree1 r acc
     


