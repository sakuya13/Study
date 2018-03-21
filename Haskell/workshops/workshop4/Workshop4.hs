module Workshop4 where 
-- QUESTION 1
-- Write a Haskell version of the tree sort algorithm, which inserts
-- all the to-be-sorted data items into a binary search tree, then performs
-- an inorder traversal to extract the items in sorted order. Use simple
-- structural induction where possible.

data Tree = Leaf
          | Node String Int Tree Tree

insertBst :: Tree -> String -> Int -> Tree
insertBst Leaf ik iv = Node ik iv Leaf Leaf
insertBst (Node k v l r) ik iv
    | ik == k   = Node ik iv l r
    | ik <  k   = Node k v (insertBst l ik iv) r
    | otherwise = Node k v l (insertBst r ik iv)

insertListToBst :: [(String, Int)] -> Tree
insertListToBst [] = Leaf
insertListToBst ((hk, hv):kvs) =
    let t0 = insertListToBst kvs
    in insertBst t0 hk hv

inOrderTraverse :: Tree -> [(String, Int)]
inOrderTraverse Leaf = []
inOrderTraverse (Node k v l r) =
    inOrderTraverse l ++ [(k, v)] ++ inOrderTraverse r

treeSort :: [(String, Int)] -> [(String, Int)]
treeSort [] = []
treeSort xs = (inOrderTraverse . insertListToBst) xs

-- QUESTION 2
-- Write a Haskell function to "transpose" a list of lists. You may assume that
-- all lists are non-empty, and that the inner lists are all the same length.
-- If you are given a list of N lists, each of length M, the result should be
-- a list of M lists, each of length N. For example,
transpose :: [[a]] -> [[a]]
transpose [] = error "transpose of zero-height matrix"
transpose list@(xs:xss)
    | len > 0   = transpose' len list
    | otherwise = error "transpose of zero_width matrix"
    where len = length xs
-- replicate n x returns a list with length n in which every element is of x 
-- value
transpose' len [] = replicate len []
transpose' len (xs:xss)
    | len == length xs = zipWith (:) xs (transpose' len xss)
    | otherwise        = error "transpose of non-rectangular matrix"

-- QUSETION3
lss :: (Num a) => [a] -> (Int, a, a)
lss [] = (0, 0, 0)
lss xs =
    let squareSum [] = 0
        squareSum (y:ys) = y*y + squareSum ys
    in (length xs, sum xs, squareSum xs)

lss' :: (Num a) => [a] -> (Int, a, a)
lss' [] = (0, 0, 0)
lss' (x:xs) =
    let (l, s, sq) = lss' xs
    in (l+1, s+x, sq+x*x)

