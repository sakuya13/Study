data Expression
    = Var Variable
    | Num Integer
    | Plus Expression Expression
    | Minus Expression Expression
    | Times Expression Expression
    | Div Expression Expression

data Variable = A | B

eval :: Integer -> Integer -> Expression -> Integer
eval a b (Var A) = a 
eval a b (Var B) = b
eval a b (Num n) = n
eval a b (Plus expr1 expr2) = eval a b expr1 + eval a b expr2
eval a b (Minus expr1 expr2) = eval a b expr1 - eval a b expr2
eval a b (Times expr1 expr2) = eval a b expr1 * eval a b expr2
eval a b (Div expr1 expr2) = eval a b expr1 `div` eval a b expr2


eval1 :: Integer -> Integer -> Expression -> Integer
eval1 a b exp =
    case exp of
        Var A -> a
        Var B -> b
        Num n -> n
        Plus exp1 exp2 -> eval' exp1 + eval' exp2
        Minus exp1 exp2 -> eval' exp1 - eval' exp2
        Times exp1 exp2 -> eval' exp1 * eval' exp2
        Div exp1 exp2 -> eval' exp1 `div` eval' exp2
    where eval' = eval1 a b


exprInstance1 =
    let exp1 = Plus (Times (Num 2) (Var A)) (Var B)
    in eval 3 4 exp1

exprInstance2 =
    let exp1 = Plus (Times (Num 2) (Var A)) (Var B)
    in eval1 3 4 exp1

