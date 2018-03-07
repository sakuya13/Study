-- Chapter 1

-- negative numbers
(-2)
(-42)
-- boolean logic
True && False
True || False
-- 1 is not True, 0 is not False
1 && Ture -- error
-- not equal to
1 /= 2
-- Haskell uses not function
not True == False
-- let construct with exponential function (only in ghci)
-- let e = exp 1
-- (e ** pi) - pi
-- What's the differences?
2 ^ 2
2 ** 2
-- what's the result? (float can't act like an integer)
5 + 4.0
-- enumeration notation
[1..10]
-- notice that the preceding use of range notation gives us a closed interval,
-- the list contains both end points
[1.0.1.25..2.0]
[1,4..15    ]
-- avoid floating point roundoff problems
[1.0..1.8] -- produces [1.0,2.0]
-- concatenation of two lists
[1,2,3] ++ [4,5,6]
-- "cons" -> ":": constructs an element to the front of a list
1 : [2,3]
1 : []
-- print
putStrLn "abcd"
-- to write a string
"abcd"
"" == []
"a" : "bc"
"abc" ++ "def"
'a'
"a" -- difference?
-- Types: types start with a uppercase, variable names start with lowercase
:set +t -- to show more info about the type in shell
:unset +t
:type "a"
:t "a"

"a"
-- special variable "it" is useful for testing
t ++ "abc"
-- to load a module
:m +Data.Ratio
-- must use Integer for both sides of a ratio number
11 % 20
1.1 % 2.2 -- error
1.1 % 20 -- error

-- Exercises
sqrt 16 -- floating
succ 6
pred 9
sin (pi / 2)
truncate pi
round 3.5
round 3.4
truncate 3.5
floor 3.7
ceiling 3.3
min 4 3
min 4.0 5.0
max 12 13
-- what is ":show bindings"?

-- Chapter 2
--  expression :: MyType
'a' :: Char
[1,2,3] :: Int -- error
--  some functions
odd 3
odd 6
compare 3 3
compare (2 3) == LT
compare 2 3 == LT
compare (sqrt 3) (sqrt 6) -- must use paretheses
-- function applications has the highest precedence
succ 9 + max 5 4 + 1
(succ 9) + (max 5 4) + 1
-- howvever
succ 9 * 10
succ (9 * 10)
-- infix function: e.g. integer division (92/10 then truncate the floating point)
div 92 10
92 `div` 10


-- composite data type: lists and tuples
[1,3,5,7] ++ [2,4,6,8] -- not a good idea if the list is too long (or repeatedly using '++' operator)
[1,3..9] ++ [12]
0 : [2,4..10]
[1,2,3] == 1:2:3:[]
-- to get an element out of a list: the list remain unchanged
"fatfat" !! 2 -- will get the first t out: indices starts at 0
[4.2, 6.9, 42.5] !! 1
-- list of lists
[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] ++ [1,1,1,1]
[0,0,0,0] : [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] !! 2
-- list comparision: First the heads are compared. If they are equal then the second elements are compared, etc.
[3,2,1] > [2,1,0]
[3,4,2] == [3,4,2]
[3,4,2] > [3,4]
[2,4] < [3,4,2]
-- list: elements must have same type
head [1,2,3,4]
head ['a','b','c']
tail [1,2,3,4]
tail "list"
tail [] -- error

last [1,2,3,4]
:t last -- a type variable
last :: [a] -> a -- “takes a list, all of whose elements have some type a, and 
                 -- returns a value of the same type a.”
-- last as a polymorphic function: parametric polymorphism
last [1,2,3,4]
last "abcde"
[a] -- is a parameterized type or a polymorphic type
-- fst as a polymorphic function: p.38
fst (1, "cat")
init [1,2,3,4,5] -- return everything but the last element of the list
-- be careful!
head []
tail []
last []
init []

-- some other list functions
take 2 [1,2,3,4,5] -- take n, returns first n elements
take 0 [1..5] -- []
take (-2) [1..5]
take 6 [1..5] -- [1,2,3,4,5]
drop 2 [1,2,3,4,5] -- drop n, returns all but first n elements
drop 4 [1,2] -- []
drop 0 [1,2] -- [1,2]
drop 7 []
drop (-2) "foo"
length [1..10]
null == [] -- use this instead of xs == [] in the condition check
null == [1]
reverse [1..10]
minimum [1..10]
maximum [1..10]
sum [5,2,1,6,3,2,5,7]
product [1,2,5,6,7,9,2,0]
-- elem: takes a thing and a list of things and tells us if that thing is an element of the list, usually called as infix
4 `elem` [1..10]
11 `elem` [1..5]
-- ranges
[1..20]
['a'..'z']
['K'..'Z']
[2,4..20]
[1,3..20]
[3,6..20]
[20..1] -- will this work?
[20,19..1]
-- infinite lists
[13,26..13*24]
take 24 [13,26..] -- one use of infinite list
take 12 (cycle "LOL ") -- cycle takes a list
take 12 (repeat 42)
replicate 3 10
-- list comprehension
[x*2 | x <- [1..10]]
[x*2 | x <- [1..10], x*2 >= 12]
[x | x <- [50..100], x `mod` 7 == 3]
[x | x <- [10..20], x /= 13, x /= 15, x /= 17]
[x*y | x <- [2,5,10], y <- [8,10,11]]
[x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
length' xs = sum [1 | _ <- xs]
let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
[[x | x <- xs, even x] | xs <- xxs]

-- TODO: type variable as a place holder: when we want to write a polymorphic type
[MyType] :: MyType
-- susbsitute MyType with the certain type
[1] :: [Int]
[[True], [False, True]] :: [[Bool]]
-- it allows us to easily write very general functions if they don't use any
-- specific behavior of the types in them, polymorphic functions:
head :: [a] -> a
fst :: (a, b) - a -- a, b don't have to be different types
-- TODO: typeclasses
:t (==)
(==) :: Eq a => a -> a -> Bool -- Eq is the Typeclass here, Eq a before the => is called a class constraint
(>) :: (Ord a) => a -> a -> Bool
compare :: Ord a => a -> a -> Ordering -- Ordering: LT RT EQ
show :: Show a => a -> String
show 3
show 5.443
show True
read :: Read a => String -> a
read "True" || False
read "4.3" + 5.6
read "[1,2,3,4]" ++ [3]
read "[1..10]" ++ [3] -- error no parse
read "4" -- TODO:
read "4" :: Int
read "4" :: float
(read "4" :: float) * 4
read "[1,2,3,4]" :: Int
read "(4, 'a'" :: (Int, Char)
[1..10] :: (Enum t, Num t) => [t] -- type in Enum: (), Bool, Char, Ordering, Int, Integer, Float and Double.
succ 10
pred 10
-- in ghci: Bounded: members have a upper and a lowe bound
minBound :: Int
maxBound :: Char
maxBound :: Bool
minBound :: Bool
-- Num: all numbers
(*) :: Num a => a -> a -> a
-- Floating: Float and Double
-- TODO: Integral: whole numbers Int and Integer
fromIntegral :: (Num b, Integral a) => a -> b
length :: [a] -> Int
length [1,2,3,4] + 3.2 -- won't work
fromIntegral (length [1,2,3,4]) + 3.2
-- tuples: elements can have different types
(1964, "Labyrinths")
(True, "hello")
(True, "hello") :: (Bool, [Char])
(4, ['a', 'm'], (16, True))
(4, ['a', 'm'], (16, True)) :: (Num t, Num t1) => (t1, [Char], (t, Bool))
-- tuple of zero elements: unit (similar to "void" in C)
() :: ()
-- these two tuples are distinct because their types have distinct order
(False, 'a')
('a', False)
(False, 'a', 'b') -- also distinct from the first one, types are (Bool, Char, Char)
-- what's its type?
[(True, []), (False, [['a']])] :: [(Bool, [[Char]])]

-- some other tuple functions: defined only for pairs
fst (1,'a') -- returns first element of a pair
snd (1,'b') -- returns second
zip [1..5] [5,5,5,5,5] -- TODO: important function for pairs
zip [1 .. 5] ["one", "two", "three", "four", "five"]
zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"] -- what if?
zip [1..] ["apple", "orange", "cherry", "mango"] -- lazy

-- a list can't have both pairs and triples in it
[(1,2), (3,4)]
[(1,2), (3,4,5)] -- error
[("cat",2),("One",2)]
[(1,2),("One",2)] -- error: the type of nth elements in every tuple must be homogeneous
-- passing an expression to a Function: function application is left-associative
-- must use parentheneses if:

head (drop 4 "azerty") -- or error

-- Function Type: -> 'to'
:t lines
lines :: String -> [String]

"" == []
-- conditional evaluation
-- file ch03_myDrop.hs
myDrop n xs = if n <= 0 || null xs -- expression of type Bool follows if as a predicate
              then xs -- active when expression after if is True, called "branches"
              else myDrop (n - 1) (tail xs) -- also "branches"
-- TODO: both branches must have the same Type
:t null
:t (||)

-- lazy evaluatioin p.33
type (2 - 1) <= 0 || null "abcd"
:t (2 - 1) <= 0
:t null "abcd"

-- The Type of a Function of More Than One Argument
take :: Int -> ([a] -> [a])

-- Chapter 3

-- Syntax in Functions

