Suppose we have a list of things and we want to assign to each of them a slot,
from Slot 0 to Slot n-1, where n is the total number of things we have.

For an element, say, a character 'a', if it is to be assigned to Slot 5, 
this is represented as ('a', 5).

Complete the following code, so that the call to `test`
will returns 
[('a',0),('b',1),('c',2),('d',3),('e',4),('f',5),('g',6),('h',7),('i',8),('j',9),('k',10),('l',11),('m',12),('n',13),('o',14),('p',15),('q',16),('r',17),('s',18),('t',19),('u',20),('v',21),('w',22),('x',23),('y',24),('z',25)]

Because we are using literate Haskell, only what've been written in the
`\begin{code} \end{code}` blocks count.

You should only have to modify functions marked `undefined`.


-------------------------

First we need to import State monad, of course.

\begin{code}

import Control.Monad.Trans.State.Lazy

\end{code}



`Counter` maintains an int count as its state.
Note that it is a functional type. Why?

\begin{code}

type Counter = State Int

\end{code}



`nextSlot` returns the current count in the counter,
and updates the counter so that next time when it is called,
a new count will be returned.
HINT: you will need to write it using the `Counter` type.

\begin{code}

-- nextSlot :: ???
nextSlot :: Counter Int -- equivalent to State Int Int
nextSlot = do
    n <- get
    put (n+1)
    return n

\end{code}



`assignSlot x` assigns a slot `n` to `x`, so that `x` is mapped to `(x, n)`.
Note, however, that the return type of the function has a `Counter` type
wrapping the pair, instead of just being the pair. Why?

\begin{code}

assignSlot :: a -> Counter (a, Int)
assignSlot x = do
    n <- nextSlot
    return (x, n)


\end{code}



`assignSlots xs` assigns slots in a consecutive manner to each element in `xs`.
This is similar to `assignSlot`, but applied to a list of things.

HINT: what its return type should be?

\begin{code}

-- assignSlots :: [a] -> ???
assignSlots :: [a] -> Counter [(a, Int)]
assignSlots [] = return []
assignSlots (x:xs) = do
    slot  <- assignSlot x
    slots <- assignSlots xs
    return $ slot:slots

\end{code}

    Additional note: you may or may not need this function depending on how
    you'd like to implement the 'assign' function below.
    But I think implementing 'assign' via this function will be how
    State monads are used in general cases: 
        specifying all the intermediate computations incrementally,
        and finally just call 'runState' or whatever to do everything in one go.



`assign xs` assigns slots in a consecutive manner.

HINT: this wraps everything we have done using the State monad. 
So you will typically need to call 'runState', 'evalState', or 'execState'.

HINT: what's the start state?

\begin{code}

assign :: [a] -> [(a, Int)]
assign xs = evalState (assignSlots xs) 0

\end{code}



`test` is a test case that assign slots to a list of lower-case letters.
If you implement everything correctly, a call to `test` should return
[('a',0),('b',1),('c',2),('d',3),('e',4),('f',5),('g',6),('h',7),('i',8),('j',9),('k',10),('l',11),('m',12),('n',13),('o',14),('p',15),('q',16),('r',17),('s',18),('t',19),('u',20),('v',21),('w',22),('x',23),('y',24),('z',25)]

\begin{code}

test :: [(Char, Int)]
test = assign ['a'..'z']

\end{code}
