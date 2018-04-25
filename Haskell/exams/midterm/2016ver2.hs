-- Q5
data Mtree a = Mnode a [Mtree a]

--showMtree :: Show a => Mtree a -> String
--showMtree (Mnode a []) = "a\n "
--showMtree (Mnode a (x:xs)) = "a\n a\n " ++ showMtree (Mnode a xs)

showMtree :: Show a => Mtree a -> String
showMtree tree = showMtree' "" tree

showMtree' :: Show a => String -> Mtree a -> String
showMtree' indent (Mnode label subtrees) =
  indent ++ show label ++ "\n" ++ concatMap (showMtree' (' ':indent)) subtrees
