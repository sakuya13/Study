-- recursive type: a lists
data List a = Cons a (List a)
            | Nil
              deriving (Show)
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- binary tree
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)
simpleTree = Node "parant" (Node "left child" Empty Empty)
                           (Node "right child" Empty Empty)

-- exercises 2  
data MyTree b = Nood b (Maybe (MyTree b)) (Maybe (MyTree b))
                deriving (Show)
-- exercises 1
toList Nil = []
toList (Cons x ys) = x : toList ys
