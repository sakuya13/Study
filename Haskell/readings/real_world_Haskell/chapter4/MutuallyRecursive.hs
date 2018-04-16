data BoolExpr
    = BoolConst Bool
    | BoolOp BoolOp BoolExpr BoolExpr 
    | CompOp CompOp IntExpr IntExpr
      deriving Show

data IntExpr
    = IntConst Int
    | IntOp IntOp IntExpr IntExpr
    | IntIfThenElse BoolExpr IntExpr IntExpr
      deriving Show

data BoolOp = And
     deriving Show
data CompOp = LessThan
     deriving Show
data IntOp = Plus | Times
     deriving Show

boolExprValue :: BoolExpr -> Bool
boolExprValue (BoolConst t) = t
boolExprValue (BoolOp And a b)
    = boolExprValue a && boolExprValue b
boolExprValue (CompOp LessThan a b)
    = intExprValue a < intExprValue b

intExprValue :: IntExpr -> Int
intExprValue (IntConst i) = i
intExprValue (IntOp Plus a b)
    = intExprValue a + intExprValue b
intExprValue (IntOp Times a b)
    = intExprValue a * intExprValue b
intExprValue (IntIfThenElse t a b)
    = if boolExprValue t then intExprValue a else intExprValue b

