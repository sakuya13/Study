

-- Q2 properFraction?
-- ftoc :: Double -> Double
ftoc f = (5/9)*(f-32)

-- Q3
-- quadRoots :: Double -> Double -> Double -> [Double]
quadRoots a b c
    = [((-b) + sqrt (b^2-4*a*c))/2*a, ((-b) - sqrt (b^2-4*a*c))/2*a]

-- Q4
mergeSortedList :: (Ord a) => [a] -> [a] -> [a]
mergeSortedList [] ys = ys
mergeSortedList xs [] = xs
mergeSortedList (x:xs) (y:ys)
    | x <= y    = x : mergeSortedList xs (y:ys)
    | otherwise = y : mergeSortedList (x:xs) ys

-- Q5
quicksort :: Ord t => [t] -> [t]
quicksort [] = []
quicksort (x:xs) =
    quicksort left ++ [x] ++ quicksort right
    where
        left = filter (<x) xs
        right = filter (>x) xs

-- Q6
data Tree k v = Node k v (Tree k v) (Tree k v)
              | Leaf 

same_shape :: Tree a b -> Tree c d -> Bool
same_shape Leaf Leaf = True
same_shape _    Leaf = False
same_shape Leaf _    = False
same_shape (Node k v l r) (Node k' v' l' r') =
    same_shape l l' && same_shape r r'
-- same_shape _ _ = False

-- Q7
data Expression
        = Var Variable
        | Num Integer
        | Plus Expression Expression
        | Minus Expression Expression
        | Times Expression Expression
        | Div Expression Expression

data Variable = A | B

eval :: Integer -> Integer -> Expression -> Integer
eval a b expr =
    case expr of
        Var A -> a
        Var B -> b
        Num n -> n
        Plus expr1 expr2 -> eval' expr1 + eval' expr2
        Minus expr1 expr2 -> eval' expr1 - eval' expr2
        Times expr1 expr2 -> eval a b expr1 * eval a b expr2
        Div expr1 expr2 -> eval a b expr1 `div` eval a b expr2
    where eval' = eval a b  -- currying

data BoolExpr
    = BoolConst Bool
    | BoolOp BoolOp BoolExpr BoolExpr 
    | CompOp CompOp IntExpr IntExpr

data IntExpr
    = IntConst Int
    | IntOp IntOp IntExpr IntExpr
    | IntIfThenElse BoolExpr IntExpr IntExpr

data BoopOp = And
data CompOp = LessThan
data IntOp = Plus | Times

intExprValue :: IntExpr -> Int
intExprValue (IntConst i) = i
intExprValue (IntOp Plus a b)
    = intExprValue a + intExprValue b
intExprValue (IntOp Times a b)
    = intExprValue a * intExprValue b
intExprValue (IntIfThenElse t a b)
    = if t then intExprValue a else intExprValue b
intExprValue (CompOp LessThan a b)
    = intExprValue a < intExprValue b

