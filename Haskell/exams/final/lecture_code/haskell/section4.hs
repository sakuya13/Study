-- Using types

-- representing expressions in Haskell
data Expr
  = Number Int
  | Variable String
  | Binop Binop Expr Expr
  | Unop Unop Expr
  deriving Show
data Binop = Plus | Minus | Times | Divide
            deriving Show
data Unop = Negate
           deriving Show


-- this function figures out whether the value of an expression can be known
-- statically, without having to know the value of variables
is_static :: Expr -> Bool
is_static expr = 
    case expr of
        Number _     -> True
        Variable _   -> False
        Unop _ expr1 -> is_static expr1
        Binop _ expr1 expr2 ->
            is_static expr1 && is_static expr2


-- a tree
data Tree = Leaf | Node String Int Tree Tree

-- Quiz
-- Maybe a tree, maybe nothing?
-- Maybe Tree

countNodes :: Tree -> Int
countNodes Leaf = 0
countNodes (Node _ _ l r) =
    1 + (countNodes l) + (countNodes r)

search_bst :: Tree -> String -> Maybe Int
search_bst Leaf _ = Nothing
search_bst (Node k v l r) ik
    | ik == k   = Just v 
    | ik < k    = search_bst l ik -- dont forget ik
    | ik > k    = search_bst r ik


