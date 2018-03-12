-- the reason to keep both String and Int is that String is for the key, Int for
-- the value of the key in a bst
data Tree = Node String Int Tree Tree
          | Leaf

-- relevant functions
count_node :: Tree -> Int
count_node Leaf = 0
count_node (Node _ _ l r) =
    1 + (count_node l) + (count_node r)

search_bst :: String -> Tree -> Maybe Int
search_bst _ Leaf = Nothing
search_bst kv (Node k v l r)
    | kv == k   = Just v
    | kv <  k   = search_bst kv l
    | otherwise = search_bst kv r

insert_bst :: Tree -> String -> Int -> Tree
insert_bst Leaf ik iv = Node ik iv Leaf Leaf
insert_bst (Node k v l r) ik iv
    | ik == k   = Node ik iv l r
    | ik <  k   = Node k v (insert_bst l ik iv) r
    | otherwise = Node k v l (insert_bst r ik iv)

assoc_list_to_bst :: [(String, Int)] -> Tree
assoc_list_to_bst [] = Leaf
assoc_list_to_bst ((hk, hv):kvs) =
    let t0 = assoc_list_to_bst kvs
    in insert_bst t0 hk hv


