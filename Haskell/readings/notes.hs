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
92 'div' 10


-- composite data type: lists and tuples
-- list: elements must have same type
head [1,2,3,4]
head ['a','b','c']
tail [1,2,3,4]
tail "list"
tail [] -- error
-- some other list functions
take 2 [1,2,3,4,5] -- take n, returns first n elements
drop 2 [1,2,3,4,5] -- drop n, returns all but first n elements
drop 4 [1,2]
drop 0 [1,2]
drop 7 []
drop (-2) "foo"
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

-- type variable as a place holder: when we want to write a polymorphic type
[MyType] :: MyType
-- susbsitute MyType with the certain type
[1] :: [Int]
[[True], [False, True]] :: [[Bool]]

-- tuple: elements can have different types
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
-- what's its type? TODO:
[(True, []), (False, [['a']])] :: [(Bool, [[Char]])]
-- some other tuple functions: defined only for pairs
fst (1,'a') -- returns first element of a pair
snd (1,'b') -- returns second

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



