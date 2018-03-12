dat Expr = Number Int
         | Variable String
         | Binop Binop Expr Expr
         | Unop Unop Expr

data Binop = Plus | Minus | Times | Divide
data Unop  = Negate

-- relevant functions
isStatic :: Expr -> Bool
isStatic expr =
    case expr of 
        Number _     -> True
        Variable _   -> False
        Unop _ expr1 -> isStatic expr1
        Binop _ expr1 expr2 ->
            isStatic expr1 &&
            isStatic expr2

isAtomic :: Expr -> Bool
isAtomic expr =
    case expr of
        Unop _ _ -> False
        Binop _ _ _ -> False
        _ -> True


