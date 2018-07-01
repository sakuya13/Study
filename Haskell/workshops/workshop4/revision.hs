-- Q1
data Tree a = Empty
          | Node a (Tree a) (Tree a)
          deriving (Show, Ord, Eq)

-- insert a single element to a tree
insert_bst :: Ord a => a -> Tree a -> Tree a
insert_bst i Empty = Node i Empty Empty
insert_bst i (Node k l r)
    | i <= k    = Node k (insert_bst i l) r
    | otherwise = Node k l (insert_bst i r)


-- TODO:to insert a list, first find ways to insert a single element to the tree
list_to_tree :: Ord a => [a] -> Tree a
list_to_tree [] = Empty
list_to_tree (x:xs) = insert_bst x (list_to_tree xs) -- this holds the recurion


tree_traverse :: Tree a -> [a]
tree_traverse tree = tree_traverse' tree []

tree_traverse' Empty acc = acc
tree_traverse' (Node x l r) acc =
    tree_traverse' l $ x:tree_traverse' r acc


tree_sort :: Ord a => [a] -> [a]
tree_sort = tree_traverse . list_to_tree


-- Q2 TODO
transpose :: [[a]] -> [[a]]
transpose matrix = 
    if any null matrix then []
    else (map head matrix):transpose (map tail matrix)


-- Q3
cumulator :: Num a => [a] -> (a,a,a)
cumulator xs = cumulator' xs (0,0,0)

cumulator' [] (len,sum,sq) = (len,sum,sq)
cumulator' (x:xs) (len,sum,sq) = 
    cumulator' xs (len+1,sum+x,sq+x*x)


