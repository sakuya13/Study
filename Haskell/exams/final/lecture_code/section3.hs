-- defining types

data Gender = Female | Male
            deriving (Eq)
instance Show Gender where 
    show Female = "female"
    show Male = "male"
data Role = Staff | Student
          deriving (Eq)
instance Show Role where
    show Staff = "staff"
    show Student = "student"

-- Female, Male, Staff and Student are values of the two types Gender and Role
-- they are also the arity-0 type constructors,
-- they are also called data constructors: given zero arguments, they each
-- construct a value (a piece of data).


-- it is actually doing the job of class Show
show2 :: Gender -> Role -> String

show2 Female Staff   = "female staff"
show2 Female Staff = show Female ++ " " ++ show Staff
show2 Female Student = "female student"
show2 Male Staff     = "male staff"
show2 Male Student   = "male student"

--data Person = Person Gender Role
--instance Show Person where
--    show (Person gender role) = show gender ++ " " ++ show role


-- corrsponds to an enumerated type in C
data Suit = Club | Diamond | Heart | Spade
            deriving (Show, Eq, Ord)
data Rank
    = R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10
    | Jack | Queen | King | Ace
    deriving Show

-- alternatively
--instance Show Rank where 
--    show = showrank
-- but has to define showrank


data Card = Card Suit Rank
-- Card and TicTacTocBoard on the right hand of the equation is the 
-- data constructor which takes arguments (arguements are the names of
-- its data type)
--
-- defining discriminated union types, which can include both disjunction and
-- conjunction at once.
data JokerColor = Red | Black
-- NCard of value of Suit and Rank or JokerCard contains value of type JokerColor
data JCard = NormalCard Suit Rank | JokerCard JokerColor


-- Quiz Define a type to represent a naughts-and-crosses board
data SqContent = X | O | Empty
data TicTacTocBoard = 
    TicTacTocBoard
    SqContent SqContent SqContent
    SqContent SqContent SqContent
    SqContent SqContent SqContent


-- define LibraryItem
data LibraryItem = Book Integer String String 
                 | Periodical Integer String Period

data Period = Days Integer | Month Integer

-- define a function title that return the title of any LibraryItem
title :: LibraryItem -> String
title (Book _ title _) = title
title (Periodical _ title _) = title


-- TODO: Maybe: if a value is optional
data Maybe t = Nothing | Just t
-- Nothing :: Maybe a
-- Just :: a -> Maybe a


data Tree a = Node a (Tree a) (Tree a)
            | TEmpty
            deriving (Show,Eq,Ord)
-- Node :: a -> Tree a -> Tree a -> Tree a
