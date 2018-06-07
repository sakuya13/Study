-- Quiz: filter out the negative numbers from a list
filter1 :: (Ord a, Num a) => [a] -> [a]
filter1 [] = []
filter1 (x:xs)
    | x < 0     = filter1 xs
    | otherwise = x:filter1 xs

-- TODO: Quiz: insert an element into a sorted list of Ints
insertElt :: Int -> [Int] -> [Int]
insertElt elt [] = [elt]
insertElt elt (x:xs)
    | elt > x  = x:insertElt elt xs -- when x is smaller than elt, keep finding the larger x
    | otherwise = elt:x:xs -- once it met the x that is larger than elt
                             -- add to the front of x

data Tree = Leaf | Node String Int Tree Tree

-- updating BST
update_bst :: Tree -> String -> Int -> Tree -- TODO: remember what you should return!!!
update_bst Leaf ik iv = Node ik iv Leaf Leaf
update_bst (Node k v l r) ik iv
    | ik == k = Node ik iv l r
    | ik  < k = Node k v (update_bst l ik iv) r
    | ik  > k = Node k v l (update_bst r ik iv)


-- TODO: convert a list of pairs to a BST
assoc_list_to_bst :: [(String,Int)] -> Tree
assoc_list_to_bst [] = Leaf
assoc_list_to_bst [(ik,iv):kvs] =
    let t0 = assoc_list_to_bst kvs
    in update_bst t0 ik iv


