import System.IO.Unsafe
import Control.Monad.Trans.State.Lazy
-- description to execution
-- main :: IO ()
-- main = do
--     putStrLn "Table of squares:"
--     print_table 1 10

print_table :: Int -> Int -> IO ()
print_table cur max
    | cur > max = return ()
    | otherwise = do
        putStrLn (table_entry cur)
        print_table (cur+1) max

table_entry :: Int -> String
table_entry n = (show n) ++ "^2 = " ++ (show (n^n))


-- non-immediate execution of IO actions
main = do
    putStrLn "Table of squares:"
    let row_actions = map show_entry [1..15]
    execute_actions (take 12 row_actions)

show_entry :: Int -> IO ()
show_entry n = do putStrLn (table_entry n)

execute_actions :: [IO ()] -> IO ()
execute_actions [] = return ()
execute_actions (x:xs) = do
    x
    execute_actions xs


-- unsafePerformIO for debugging
-- takes as arguement an IO operation (f::IO t)
-- the function f returns IO t
-- unsafePerformIO executes the described IO operation and returns the value
sum1 :: Int -> Int -> Int
sum1 x y = unsafePerformIO $ do
    putStrLn ("summing " ++ (show x) ++ " and " ++ (show y))
    return (x + y)
-- unsafePerformIO :: IO t -> t



-------------------------------State monad--------------------------------
-- lecture examples
-- simply adds 1 to each element of a tree, does not need monad
data Tree a = Empty | Node (Tree a) a (Tree a)
              deriving Show
type IntTree = Tree Int

incTree :: IntTree -> IntTree
incTree Empty = Empty
incTree (Node l e r) =
    Node (incTree l) (e + 1) (incTree r)

-- threading state
-- add 1 to the leftmost element, 2 to the next element, and so on
-- without State monad
incTree1 :: IntTree -> IntTree
incTree1 tree = fst (incTree1' tree 1)  -- fst :: (a, b) -> a

incTree1' :: IntTree -> Int -> (IntTree, Int)
incTree1' Empty n = (Empty, n)
incTree1' (Node l e r) n =
    let (newl, n1) = incTree1' l n
        (newr, n2) = incTree1' r (n1 + 1)
    in  (Node newl (e + n1) newr, n2)

-- with State monad
incTree2 :: IntTree -> IntTree
incTree2 tree = fst (runState (incTree2' tree) 1)
-- runState :: State s a -> s -> (a, s)

incTree2' :: IntTree -> State Int IntTree
incTree2' Empty = return Empty
incTree2' (Node l e r) = do
    newl <- incTree2' l
    n <- get  -- gets the current state
    put (n + 1)
    newr <- incTree2' r
    return (Node newl (e + n) newr)

-- runState :: State s a -> s -> (a, s)
-- first s is the current state, s as the second arguement is the initial state,
-- (a, s) is the tuple of returned value and the final state
-- evalState :: State s a -> s -> a
-- execState :: State s a -> s -> s

-- other examples
tick :: State Int Int
tick = do
    n <- get -- get the current state
    put (n+1) -- update the state
    return n

plusOne :: Int -> Int
plusOne n = execState tick n -- the moment you put n here, the state s has
                             -- changed to n
                             -- this is not passing parameter to tick

