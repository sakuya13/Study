
-- any :: (a -> Bool) -> [a] -> Bool
-- all :: (a -> Bool) -> [a] -> Bool
-- all (elem 'e') ["eclectric", "elephant", "legion"]
-- any (\x -> elem x "aeiou") "sky"
-- any (flip elem "aeiou") "hmmmm"


-- Monads
-- TODO: a monad M is a type constructor that supports two operations:
-- (>>=) :: M a -> (a -> M b) -> M b
-- takes a wrapped value with type a that is M a
-- unwrap the value to a
-- passes the a to the second arguement of a function, which takes a and returns a wrapped b
-- then the result of the second arguement is the final result

-- return :: a -> M a
-- takes a value of type a and wrap it with monad type M, that is M a


-- Maybe and MaybeOK monades

-- monad ops for Maybe
-- data Maybe t = Just t
--              | Nothing
-- return x = Just x
-- 
-- (Just x) >>= f = f x
-- Nothing >>= _  = Nothing

-- monad ops for MaybeOK
data MaybeOK t = OK t
               | Error String
               deriving Show
return x = OK x -- identity operation

-- (OK x) >>= f    = f x -- sequencing operation
-- (Error m) >>= _ = Error m

maybe_head :: [a] -> MaybeOK a
maybe_head [] = Error "head of empty list"
maybe_head (x:_) = OK x

maybe_sqrt :: Int -> MaybeOK Double
maybe_sqrt x =
    if x >= 0 then 
        OK (sqrt (fromIntegral x))
    else
        Error "sqrt of negative number"
-- fromIntegral :: (Num b, Integral a) => a -> b
-- sqrt :: Floating a => a -> a


-- how to encode a sequence of operations such as taking the had of a list
-- and computing its square root?
-- using monads
maybe_sqrt_of_head :: [Int] -> MaybeOK Double
maybe_sqrt_of_head l =
    maybe_head l >>= maybe_sqrt

-- without monads
maybe_sqrt_of_head1 :: [Int] -> MaybeOK Double
maybe_sqrt_of_head1 l =
    let mh = maybe_head l in
        case mh of
            Error m -> Error m
            OK head -> maybe_sqrt head


-- IO in Haskell
-- IO t
-- reading input:
-- getChar :: IO Char
-- getLine :: IO String
--
-- writing output
-- putChar :: Char -> IO ()
-- putStr :: String -> IO ()
-- putStrLn :: String -> IO ()
-- print :: (Show a) => a -> IO () -- will evaluate the expr
-- 
-- 0-tuples:
-- () :: ()


-- sequencing operation f >>= g
-- 1. calls f, returns rf or ()
-- 2. calls g rf, returns rg or ()
-- 3. returns rg inside IO as the result of f >>= g
-- may create a chain of any number of IO actions
hello :: IO ()
hello = 
    putStr "Hello, "
    >>=
    \_ -> putStrLn "world!"


greet :: IO ()
greet = 
    putStr "Greetings! What is your name? "
    >>=
    \_ -> getLine
    >>=
    \name -> (
        putStr "Where are you from? "
        >>=
        \_ -> getLine
        >>=
        \town ->
            let msg = "Welcome, " ++ name ++ " from " ++ town
            in putStrLn msg
    )


-- do block: syntactic sugar
hello' = do
    putStr "Hello, "
    putStrLn "world!"

greet' :: IO ()
greet' = do
    putStr "Greetings! What is your name? "
    name <- getLine  -- note that the direciton of the arrow is opposite to that above
    putStr "Where are you from? "
    town <- getLine
    let msg = "Welcome, " ++ name ++ " from " ++ town
    putStrLn msg
    putStrLn $ "Welcome, " ++ name ++ " from " ++ town -- without $ it wont work
                                                       -- due to operator priorities
-- TODO: ($) :: (a -> b) -> a -> b


-- Quiz: countDown
-- this ver wont halt when n < (-1)
countDown :: Int -> IO ()
countDown (-1) = putStrLn "Done"
countDown n = do
    print n -- TODO: cannot use putStrLn here
            -- putStrLn :: String -> IO ()
            -- print :: Show a => a -> IO ()
            -- show :: Show a => a -> String
            -- shows :: Show a => a -> ShowS
    countDown $ n - 1


-- TODO: correct ver.
countDown1 :: Int -> IO ()
countDown1 n
    | n < 0     = putStrLn "Done"
    | otherwise = do
         print n
         countDown $ n - 1


-- TODO: if a function does IO and returns a value, and the code that computes 
-- the return value does not do IO, will have to invoke return monad operation
-- as the last operation in the do block
main :: IO ()
main = do
    putStrLn "Please input a string"
    len <- readlen
    putStrLn $ "The length of that string is " ++ show len

readlen :: IO Int
readlen = do
    str <- getLine
    return (length str) -- length does not do IO, but it computes the returned 
                        -- value


