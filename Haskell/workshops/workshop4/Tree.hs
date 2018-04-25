data Tree k v = Leaf
              | Node k v (Tree k v) (Tree k v)
              deriving (Show, Ord, Eq)

sameShape :: Tree a b -> Tree c d -> Bool
sameShape Leaf _ = False
sameShape _ Leaf = False
sameShape Leaf Leaf = True
sameShape (Node _ _ l r) (Node _ _ l' r')
    = sameShape l l' && sameShape r r'

countNode :: Tree a b -> Int
countNode Leaf = 0
countNode (Node k _ l r) =
    1 + countNode l + countNode r

searchTree :: Ord a => Tree a b -> a -> Maybe b 
searchTree Leaf _ = Nothing
searchTree (Node k v l r) ik
    | ik == k = Just v
    | ik <  k = searchTree l ik
    | ik >  k = searchTree r ik
searchTree _ _ = Nothing

insertNode :: (Ord a, Ord b) => Tree a b -> (a,b) -> Tree a b
insertNode Leaf (ik,iv) = Node ik iv Leaf Leaf
insertNode (Node k v l r) (ik,iv)
    | ik == k = Node ik iv l r
    | ik <  k = Node k v (insertNode l (ik,iv)) r
    | ik >  k = Node k v l (insertNode r (ik,iv))
insertNode _ _ = Leaf

-------------------------------------------------------------
--                      99Problem-Trees 
-------------------------------------------------------------
-- P56: Symmetric binary tree
symmetric :: Tree a b -> Bool
symmetric Leaf = True
symmetric (Node _ _ l r) =
    countNode l == countNode r

-- ver2
mirror Leaf Leaf = True
mirror (Node _ _ l r) (Node _ _ l' r') =
    mirror l r' && mirror r l'
mirror _ _ = False

symmetric' :: Tree a b -> Bool
symmetric' t = mirror t t


-- P57 construct a binary search tree
-- @construct@ bst, the root of the tree is the last of the list
construct :: (Ord a, Ord b) => [(a,b)] -> Tree a b
construct ((k,v):kvs) =
    let t0 = construct kvs
    in insertNode t0 (k,v)
construct [] = Leaf
-- | @construct'@ is equivalent to @construct@
construct' :: (Ord a, Ord b) => [(a,b)] -> Tree a b
construct' = foldr (flip insertNode) Leaf

-- bst construction, traverse the list from left to right,
-- the root is the head of the list.
constructBst :: (Ord a, Ord b) => [(a,b)] -> Tree a b
constructBst = foldl insertNode Leaf

treeSort :: (Ord a, Ord b) => [(a,b)] -> [(a,b)]
treeSort = inOrderTraverse . constructBst

inOrderTraverse :: Tree a b -> [(a,b)]
inOrderTraverse Leaf = []
inOrderTraverse (Node k v l r) =
    inOrderTraverse l ++ [(k,v)] ++ inOrderTraverse r

-- P58 generate and test paradigm

