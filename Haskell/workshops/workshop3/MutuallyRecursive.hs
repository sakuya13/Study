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

intExprValue :: IntExpr -> Int
intExprValue exp =
    case exp of
        IntConst i -> i
        IntOp Plus exp1 exp2 -> intExprValue exp1 + intExprValue exp2
        IntOp Times exp1 exp2 -> intExprValue exp1 * intExprValue exp2
        IntIfThenElse bool exp1 exp2 ->
            if boolExprValue bool 
            then intExprValue exp1 
            else intExprValue exp2

boolExprValue exp =
    case exp of
        BoolConst bool -> bool
        BoolOp And exp1 exp2 -> boolExprValue exp1 && boolExprValue exp2
        CompOp LessThan exp1 exp2 -> intExprValue exp1 < intExprValue exp2


