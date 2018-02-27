-- Chapter 1

-- negative numbers
(-2)
(-42)
-- bollean logic
True && False
True || False
-- 1 is not True, 0 is not False
1 && Ture -- error
-- not equal to
1 /= 2
-- Haskell uses not function
not True == False
-- let construct with exponential function (only in ghci)
let e = exp 1
(e ** pi) - pi
-- What's the differences?
2 ^ 2
2 ** 2
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

