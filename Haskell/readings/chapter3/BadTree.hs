-- bad_nodesAreSame (Node a _ _) (Node b _ _) = Just a
-- bad_nodesAreSame _            _            = Nothing

data Tree t = Node t (Tree t) (Tree t)
            | Empty

nodesAreSame :: (Eq t) =>  Tree t -> Tree t -> Maybe t
nodesAreSame (Node a _ _) (Node b _ _)
    | a == b     = Just a
nodesAreSame _ _ = Nothing

