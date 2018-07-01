-- Q1
-- (a): (<) :: Ord a => a -> a -> Bool

-- (b): map (+3) :: Num a => [a] -> [a]

-- (c): type error

-- (d): [1,2]

-- (e): 3 TODO: lazy evaluation?



-- Q3
-- We can distinguish different Units through defining it in the
-- algebraic type system. Wrap them up in the data constructor
-- to avoid the mixture. For example:
data Distance = Meter Double

meter_to_Distance :: Double -> Distance
meter_to_Distance m = Meter m

feet_to_distance :: Double -> Distance
feet_to_distance f = Meter (f*0.3048)

add_distances :: Distance -> Distance -> Distance
add_distances (Meter a) (Meter b) = Meter (a+b)




-- Q4 
-- (a):
data Card = C1 | C2 | C3 | C4 | C5
            deriving (Show, Ord, Eq)
-- (<) is the defined in the Ord type class,
-- deriving ensures that Card is in the Ord class 
-- and makes (<) comparison operation effective.
-- The order of the comparison will the order of the definition above,
-- from smaller (left-hand side) to larger (right-hand side).

-- (b):
-- Yes. Through deriving Ord and Eq, Haskell add the type Card to Ord 
-- and Eq class, which enforce such laws. However, if the programmer doesn't
-- derive the type to Ord class directly, but define its instance manually,
-- then they can also avoid such laws.


-- Q6
-- (a):
data Ttree t = Nil | Node3 t (Ttree t) (Ttree t) (Ttree t)

same_shape :: Ttree t -> Ttree t -> Bool 
same_shape Nil Nil = True
same_shape (Node3 k l m r) (Node3 k' l' m' r') = 
    (same_shape l l') && (same_shape m m') && (same_shape r r')
same_shape _ _ = False
-- (b):
-- TODO: implement the state monad ver??
-- runState :: State s a -> s -> (a, s)
-- evalState :: State s a -> s -> a
-- execState :: State s a -> s -> s
-- use state monad to record the length and the corresponding tree
-- append list while traversing the tree
-- return a tuple (shortest list, concatenation of the lists)

-- naive ver.
--flatten_tree :: Ttree [a] -> ([a], [a])
--flatten_tree Nil _ = ([], [])
--flatten_tree (Node3 xs l m r) pigu = 
--    (xs ++ ft1 ++ ft2 ++ ft3, xiaopigu)
--    where (ft1, p1) = flatten_tree l
--          (ft2, p2) = flatten_tree m
--          (ft3, p3) = flatten_tree r
--          xiaopigu = min4 xs p1 p2 p3

--(piguchangdu, xiaopigu)
-- 3, [1,2,3]

-- 
flatten_tree1 :: Ttree [a] -> [a]
flatten_tree1 ttree = flatten_tree1' ttree []

flatten_tree1' :: Ttree [a] -> [a] -> [a]
flatten_tree1' Nil acc = acc
flatten_tree1' (Node3 xs l m r) acc = 
    xs ++ (flatten_tree1' l (flatten_tree1' m (flatten_tree1' r acc)))


-- O(n) ver.
flatten_tree2 :: Ttree [a] -> ([a],[a]) -- (shortest lst, concatenation)
flatten_tree2 ttree@(Node3 lst _ _ _) = flatten_tree2' ttree (lst,[])

flatten_tree2' :: Ttree [a] -> ([a],[a]) -> ([a],[a])
flatten_tree2' Nil acc = acc
flatten_tree2' (Node3 xs l m r) acc = (shortest, concatLst)
  where 
    concatLst = xs ++ lst'
    shortest = if (length xs) < length shortest' then xs else shortest'
    (shortest', lst') = 
            (flatten_tree2' l (flatten_tree2' m (flatten_tree2' r acc)))
-- TODO: further optimisation can be done on the length shortest'
-- it should return a tupe (len, shortest') to avoid duplicate
-- calculation of length every time when deciding shortest.





