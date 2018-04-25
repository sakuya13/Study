------------------------------------------------------------------
-- Week2
------------------------------------------------------------------
-- Q1 Write a Haskell function sumlist that add a list of integers
sumlist :: [Int] -> Int
sumlist = foldl (+) 0

sumlist' :: [Int] -> Int
sumlist' = foldr (+) 0
-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

-- is the following the same?
foo1 :: [Int] -> Int
foo1 = foldl (-) 0

foo2 :: [Int] -> Int
foo2 = foldr (-) 0

sumlist'' :: [Int] -> Int
sumlist'' [] = 0
sumlist'' (x:xs) = x + sumlist'' xs

-- Q2 Define a sumlist which works for any numeric type
sumNum :: (Num a) => [a] -> a
sumNum = foldl (+) 0

-- given the upper bound of a list, generate the list
iota :: Int -> [Int]
iota n = iotar 1 n
    where iotar m n 
            | m <  n = m : iotar (m+1) n
            | m == n = [n]
          iotar _ _ = []

-- Q3 Define a type to represent a naughts and corsses game
data SquareContent = X | O | Empty
data TicTacBoard = TicTacBoard
                   SquareContent SquareContent SquareContent
                   SquareContent SquareContent SquareContent
                   SquareContent SquareContent SquareContent


-- Q3 Define a type LibraryItem
-- answer from slides
data LibraryItem = Book       Integer String String
                 | Periodical Integer String Period

data Period = Days Integer | Months Integer

------------------------------------------------------------------
-- Week 3
------------------------------------------------------------------
-- representing expressions in Haskell
data Expr = Number Int
          | Variable String
          | Binop Binop Expr Expr
          | Unop Unop Expr

data Binop = Plus' | Minus | Times' | Divide
data Unop = Negate

-- check if an expression is static
isStatic :: Expr -> Bool
isStatic expr =
    case expr of
        Number _    -> True
        Variable _  -> False
        Unop _ expr1 -> isStatic expr1
        Binop _ expr1 expr2 -> isStatic expr1 && isStatic expr2

-- data type of a BST in Haskell
data Btree = Leaf | Node String Int Btree Btree
-- data type of a polymophic tree
data Ptree k v = Leaf' | Node' k v (Ptree k v) (Ptree k v)
                 deriving (Ord, Eq, Show)

-- Q1 "maybe a tree, maybe nothing"
-- answer: Maybe BTree
-- count node in a bst
countNode :: Btree -> Int
countNode Leaf = 0
countNode (Node _ _ l r) = 
    countNode l + (countNode r) + 1

-- search node using maybe
searchBst :: Btree -> String -> Maybe Int
searchBst Leaf _ = Nothing
searchBst (Node k v l r) target 
    | k == target   = Just v
    | k <  target   = searchBst r target
    | k >  target   = searchBst l target
searchBst _ _ = Nothing

-- update or insert bst
updateBst :: Btree -> String -> Int -> Btree
updateBst Leaf ik iv = Node ik iv Leaf Leaf
updateBst (Node k v l r) ik iv
    | ik == k      = Node ik iv l r
    | ik <  k      = Node k v (updateBst l ik iv) r
    | otherwise    = Node k v l (updateBst r ik iv)

-- convert list of (k, v) into a bst
convertListBst :: [(String, Int)] -> Btree
convertListBst [] = Leaf
convertListBst ((hk,hv):kvs) =
    let t0 = convertListBst kvs
    in updateBst t0 hk hv


-- Q2 filter out the negative numbers in a list
filterNegative :: (Num a, Ord a) => [a] -> [a]
filterNegative = filter (>0)

filterNegative' :: (Num a, Ord a) => [a] -> [a]
filterNegative' [] = []
filterNegative' (x:xs)
    | x < 0     = filterNegative' xs
    | otherwise = x:filterNegative' xs

-- Q3 insert an element into a sorted list
insertList :: (Ord a) => a -> [a] -> [a]
insertList elt [] = [elt]
insertList elt (x:xs)
    | elt <= x  = elt:x:xs
    | otherwise = x:insertList elt xs 

------------------------------------------------------------
-- Week 4 
------------------------------------------------------------
-- Q1 Write a interpreter
data BoolExpr
    = BoolConst Bool
    | BoolOp BoolOp BoolExpr BoolExpr
    | CompOp CompOp IntExpr IntExpr

data IntExpr
    = IntConst Int
    | IntOp IntOp IntExpr IntExpr
    | IntIfThenEles BoolExpr IntExpr IntExpr

data BoolOp = And
data CompOp = LessThan
data IntOp = Plus | Times

intExprValue :: IntExpr -> Int
intExprValue (IntConst i) = i
intExprValue (IntOp Plus i1 i2) = intExprValue i1 + intExprValue i2
intExprValue (IntOp Times i1 i2) = intExprValue i1 * intExprValue i2
intExprValue (IntIfThenEles b i1 i2) =
    if boolExprValue b
    then intExprValue i1
    else intExprValue i2

boolExprValue :: BoolExpr -> Bool
boolExprValue (BoolConst b) = b
boolExprValue (BoolOp And b1 b2) =
    boolExprValue b1 && boolExprValue b2
boolExprValue (CompOp LessThan i1 i2) =
    intExprValue i1 < intExprValue i2

-- Q2 would this work?
is_even :: Int -> Bool
is_even x = (mod x 2) == 0
-- yes
is_pos :: Int -> Bool
is_pos x = x > 0
-- yes
is_long :: String -> Bool
is_long x = length x > 3
-- yes

-- Q3 what would the following return?
-- filter (<3) [1..10]
-- [1,2]
-- filter (3<) [1..10]
-- [4..10]

-- Q4 have a look at the defination of hypotenuse
-- square x = x ^ 2
-- hypotenuse sides = sqrt (sum (map square sides))
-- use point-free style:
square :: Floating a => a -> a
square x = x ^ 2

hypotenuse :: Floating a => [a] -> a
hypotenuse = sqrt . sum . (map square)

hypotenuse' = sqrt . sum . (map (\x -> x^2))

-- Q5 what is the type of the following functions?
-- map :: (a -> b) -> [a] -> [b]
-- (+1) :: Num a => a -> a
-- map (+1) :: Num a => [a] -> [a]
--







