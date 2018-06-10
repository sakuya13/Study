-- import Data.MultiMap
-- expression of algebraic types in haskell
data Expr
    = Const Const
    | Var String
    | Binop Binop Expr Expr
    | Unop Unop Expr
    | Call String [Expr]
    | ITE Expr Expr Expr -- if-then-else

data Binop = Add | Sub | Product
data Unop = Uminus
data Const = IntConst Int | FloatConst Double


-- multimaps: maps a key to a list of values
-- if the list is empty, the key shouldn't be in the map
-- obvious definition
-- has to check if the list is empty everytime
-- type MultiMap k v = Map k [v]
--
--
-- semantically tighter definition
-- doesnt have to check the emptyness
type MultiMap k v = Map k (OneOrMore v)
data OneOrMore v = OneOrMore v [v]


-- conversion between different Units
data Length = Meters Double

meters_to_length :: Double -> Length
meters_to_length m = Meters m

-- 1 m = (1 f)*0.3048
feet_to_length :: Double -> Length
feet_to_length f = Meters (f*0.3048)

add_lengths :: Length -> Length -> Length
add_lengths (Meters a) (Meters b) = Meters (a+b)


-- different use of one unit 
-- two kinds of quantities
data Duration = Seconds Int
data Time = SecondsSinceEpoch Int

add_durations :: Duration -> Duration -> Duration
add_durations (Seconds a) (Seconds b) = Seconds (a+b)

add_duration_to_time :: Time -> Duration -> Time
add_duration_to_time (SecondsSinceEpoch sse) (Seconds t) =
    SecondsSinceEpoch (sse + t)


data Money
    = USD_dollars Double
    | AUD_dollars Double
    | GBP_pounds Double


-- fatlist: the list containing more than two nodes [head:tail]
data FatList a
    = FCons0 (FatRest a)
    | FCons1 a (FatRest a)
    | FCons2 a a (FatRest a)
    deriving (Show, Eq)

data FatRest a
    = FatNil
    | FatRest a a a (FatRest a)
    deriving (Show, Eq)

-- defining a typeclass
class List l a where
    nil  :: l a
    cons :: a -> l a -> l a
    car :: l a -> a -- head
    cdr :: l a -> l a -- tail
    len :: l a -> Int

instance List FatList a where
    nil  = FCons0 FatNil
    cons = fcons
    len  = fatLength

    car (FCons0 (FatRest x1 _ _ _)) = x1
    car (FCons1 x1 _)               = x1
    car (FCons2 x1 _ _)             = x1

-- ordinary list types instances
instance List [] a where
    nil  = []
    cons = (:)
    len  = length
    append = (++)



