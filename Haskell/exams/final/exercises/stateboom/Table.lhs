Attempt this after finishing 'Slot'.

Again, only functions that return `undefined` should be modified.

This one looks bizzarely long because there're many descriptions of 
background/motivation in it.
Actually the job is quite straightforward ...
Since everything is kept to artificially as simple as possible.
(So again you find that it looks like using State monad 
for the sake of usting State monad ...)


------------------------------------------

Below are preliminaries for setting up a symbol table.
We use `Data.Map` which is a default data structure to represent a symbol table.
Basically, the type `Map k v` represents mappings from keys to values,
where `k` is the type of the keys and `v` is the type of values.
In our example, `Map Symbol Info` represents mappings from `Symbol` to `Info`.
So if we have symbols "symb1", "symb2", "symb3" ... and 
information of the symbols "info1", "info2", "info3" ..., 
then you can think of `SymbolTable` as the mappings
    symb1   ->  info1
    symb2   ->  info2
    symb3   ->  info3
        ...
Or in a more natural way, it is just the table
    | Symbol    | Info      |
    |-----------|-----------|
    | symb1     | info1     |
    | symb2     | info2     |
    | symb3     | info3     |
    | ...       | ...       |

You don't need to peek into the details of `Data.Map`.
I just want to make an exercises where we don't use Int and counter things ...

\begin{code}

import Control.Monad.Trans.State.Lazy
-- Have to import it here, Haskell is really naughty sometimes...

import Data.Map

type Symbol = String
type Info = String

type SymbolTable = Map Symbol Info

\end{code}


-------------------------------------------

The State monad stuff.
This time, we use our `SymbolTable` as the state, instead of `Int`.
So we will update the table, access information from the table, etc.,
instead of simply counting.

\begin{code}

type Maintainer = State SymbolTable

\end{code}



In order to have a feeling about what we're doing, 
let's see how we want to use our `SymbolTable` and `Maintainer` first.

Suppose, after preprocessing (e.g., parsing some source code), 
we now have a list of symbol-info pairs that we want to store it 
in a symbol table and use them in a later stage.
Now the list of symbol-info pairs looks like this:
    [(symb1, info1), (symb2, info2), ...]

Say, our next step is to process these symbols, 
using the `processSymbols` that will be defined below.
In the processing stage we want to insert the symbols with the information 
into the symbol table.
The `processSymbols` function should return us a symbol table that have 
all these symbols inserted.

To implement the `processSymbols` function, 
you will need to manipulate State monad---more specifically, our `Maintainer`.
You'd probably want to implement this function later when you have finished
the inserting functions (`insertSymbol` and `insertSymbols`) below.

HINT: Because here we are building a symbol table from scratch,
the start state is obviously an empty table.
The 0-ary `empty` (in `Data.Map`, which we have obviously imported) function 
returns a fresh new map which can be used as the empty symbol table.

\begin{code}

processSymbols :: [(Symbol, Info)] -> SymbolTable
processSymbols pairs = snd (runState (insertSymbols pairs) empty)

\end{code}



Once we have a symbol table ready, we can access information for a given symbol
from the table.
Suppose we've now come to the stage to evaluate some input, 
where we need to access the information for the symbols in the table
to tell what these symbols do.
The `processInput` function below process the input (a list of symbols),
and returns a corresponding list of information for symbols.
Note that it is possible the symbols are not in the table, so `Maybe` is used.
(If that seems puzzling, see the implementation of `lookupSymbol` section first.)

Treat this as a description of background/motivation.
Finish the lookup section below before returning to this function.

\begin{code}

processInput :: [Symbol] -> SymbolTable -> [Maybe Info]
processInput symbs table = fst (runState (lookupSymbols symbs) table)

\end{code}



Now chain them together.
The `process` function process first the symbol-info pairs to create 
the symbol table, and then process the input to find the corresponding information.

HINT: Basically we just need to call `processSymbols` and `processInput`.
Think about how the state (the symbol table) is passed between the two functions?

\begin{code}

process :: [(Symbol, Info)] -> [Symbol] -> [Maybe Info]
process pairs symbs = processInput symbs (processSymbols pairs)

\end{code}



An extra opportunity for playing around with IO monad and Maybe!
Implement `printProcessed` function to print out the information returned 
by the `process` function, one piece of informtion on one line.
If the symbol is found and the information is given, just print out the information.
If the symbol is not found, print out the information as "unknown symbol".

\begin{code}

printProcessed1 :: [Maybe Info] -> IO ()
printProcessed1 [] = return ()
printProcessed1 (m:mis)
    | m == Nothing = do
        putStrLn "unknwon symbol"
        printProcessed1 mis
    | otherwise    = do
        print m
        printProcessed1 mis

printProcessed :: [Maybe Info] -> IO ()
printProcessed [] = return ()
printProcessed (m:mis) = do  -- chain case m of and the recursive call together
    case m of
        Nothing -> putStrLn "unknwon symbol"
        Just s -> putStrLn s  -- upwrap Maybe monad (filter Just)
    printProcessed mis

\end{code}



If everything implemented successfully, the test below should work.
The result print on the screen should be:
    something plus something
    something minus something
    something explodes
    something eats something
    unknwon symbol
    something explodes

\begin{code}

test :: IO ()
test = do
    let ps = process testPairs testInput
    putStrLn "Output:"
    printProcessed ps

testPairs :: [(Symbol, Info)]
testPairs = [ ("+", "something plus something")
            , ("-", "something minus something")
            , ("/", "something eats something")
            , ("-", "something minus something")
            , ("*", "something explodes")
            ]

testInput :: [String]
testInput = ["+", "-", "*", "/", "~", "*"]

\end{code}


--------------------------

Below is the inserting section.
After implementing functions in this section,
you can refer back to the `processSymbols` function and finish it.

In what follows, we will need the `Data.Map.insert` function, which 
has the type
    insert :: Ord k => k -> a -> Map k a -> Map k a
to insert a key-value pair into a map.
That is, `insert key value oldMap` returns `newMap`.
For a concrete example, see below.

What we need to do now is to insert a symbol @s@ with given information @i@ 
into the symbol table.
Without using State monad, we would typically write it as

\begin{code}
insertSymbol_ :: Symbol -> Info -> SymbolTable -> SymbolTable
insertSymbol_ symb info table = insert symb info table
\end{code}

And it returns us a new symbol table.
(From here on, we use the suffix "_" to indicate example functions that are 
written without using State monad.)

Now, rewrite it using State monad, or more specifically, 
using our `Maintainer` type.

\begin{code}

insertSymbol :: Symbol -> Info -> Maintainer ()
insertSymbol symbol info = do
    table <- get
    put $ insert symbol info table
    --return ()

\end{code}



And to make life easier, also write a `insertSymbols` function
that is similar to `insertSymbol` but do the job for a list of symbols.
(The symbols and the information are given as a pair, see the function signature.)

\begin{code}

insertSymbols :: [(Symbol, Info)] -> Maintainer ()
insertSymbols [] = return ()
insertSymbols ((symbol, info):xs) = do
    insertSymbol symbol info
    insertSymbols xs
    --return ()

\end{code}



----------------------------------


Once we've inserted all the symbols into the table,
we want to look up some symbol in the table.

For this, we will need `Data.Map.lookup`:
    lookup :: Ord k => k -> Map k a -> Maybe a
That is, `lookup key map` returns `Just value` if the `key` is in the map,
otherwise `Nothing`.

Without State monad, looking up in our symbol table can be implemented as

\begin{code}
lookupSymbol_ :: Symbol -> SymbolTable -> Maybe Info
lookupSymbol_ symb table = Data.Map.lookup symb table
\end{code}

Rewrite it with our `Maintainer` type.
Note that you should probably retain the `Maybe` monad.

\begin{code}

-- lookupSymbol :: ???
lookupSymbol :: Symbol -> Maintainer (Maybe Info)
lookupSymbol symbol = do
    table <- get
    return $ Data.Map.lookup symbol table

\end{code}



And the list of symbols version of lookup as well.

\begin{code}

-- lookupSymbols :: ???
lookupSymbols :: [Symbol] -> Maintainer [Maybe Info]
lookupSymbols [] = return []
lookupSymbols (s:symbols) = do
    i <- lookupSymbol s
    is <- lookupSymbols symbols
    return (i:is)

\end{code}
