data Cord a = Nil | Leaf a | Branch (Cord a) (Cord a)
              deriving Show

append_cords :: Cord a -> Cord a -> Cord a
append_cords a b = Branch a b

-- slow ver
cord_to_list :: Cord a -> [a]
cord_to_list Nil = []
cord_to_list (Leaf x) = [x]
cord_to_list (Branch a b ) =
    (cord_to_list a) ++ (cord_to_list b)

-- using accumulators
cord_to_list' :: Cord a -> [a]
cord_to_list' c = cord_to_list'' c []

cord_to_list'' :: Cord a -> [a] -> [a]
cord_to_list'' Nil rest = rest
cord_to_list'' (Leaf x) rest = x:rest
cord_to_list'' (Branch a b) rest =
    cord_to_list'' a (cord_to_list'' b rest)



