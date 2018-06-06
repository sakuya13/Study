-- polymorphic types

data Tree k v = Leaf | Node k v (Tree k v) (Tree k v)

-- membership of Ord implies membership of Eq, but not vice versa
search_bst :: Ord k => Tree k v -> k -> Maybe v
search_bst Leaf _ = Nothing
search_bst (Node k v l r) ik 
    | ik == k   = Just v
    | ik  < k   = search_bst l ik
    | otherwise = search_bst r ik


-- polymorphic list insertion
listInsert :: Ord a => a -> [a] -> [a]
listInsert elt [] = [elt]
listInsert elt (x:xs)
    | x < elt   = x:listInsert elt xs
    | otherwise = elt:x:xs


-- mutually recursive type
data BoolExpr
    = BoolConst Bool
    | BoolOp BoolOp BoolExpr BoolExpr
    | CompOp CompOp IntExpr IntExpr

data IntExpr
    = IntConst Int
    | IntOp IntOp IntExpr IntExpr
    | IntIfThenElse BoolExpr IntExpr IntExpr

data BoolOp = And
data CompOp = LessThan
data IntOp = Plus | Times

-- Quiz: write functions to evaluate a BoolExpr and an IntExpr
boolExprValue :: BoolExpr -> Bool
boolExprValue expr =
    case expr of
        BoolConst b -> b
        BoolOp And e1 e2 -> (boolExprValue e1) && (boolExprValue e2)
        CompOp LessThan i1 i2 -> (intExprValue i1) < (intExprValue i2)

intExprValue :: IntExpr -> Int
intExprValue expr =
    case expr of
        IntConst i -> i
        IntOp Plus i1 i2 -> (intExprValue i1) + (intExprValue i2)
        IntOp Times i1 i2 -> (intExprValue i1) * (intExprValue i2)
        IntIfThenElse e i1 i2 -> if boolExprValue e 
                                 then intExprValue i1
                                 else intExprValue i2

-- intExprValue (IntOp Times (IntConst 6) (IntConst 7))


