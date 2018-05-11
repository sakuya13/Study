hello :: IO ()
hello = 
    putStr "Hello "
    >>=
    \_ -> putStrLn "World!"

-- the third monad op
-- (>>) :: m a -> m b -> m b

hello' =
    putStr "Hello "
    >>
    putStrLn "World!"


greet :: IO ()
greet = 
    putStrLn "Greetings! What's your name?"
    >>=
    \_ -> getLine
    >>=
    \name -> ( -- make sure that name will be included in all of the following actions
        putStrLn "Where are you from?"
        >>=
        \_ -> getLine
        >>=
        \town ->
            let msg = "Welcome, " ++ name ++ " from " ++ town
            in putStrLn msg
    )

-- do: syntastic sugar of sequencing actions
hello'' = do
    putStr "Hello "
    putStrLn "World!"

greet'' = do
    putStrLn "Greetings! Your name?"
    name <- getLine -- var <- expr to bind the variable
    putStrLn "Your hometown?"
    town <- getLine
    let msg = "Welcome, " ++ name ++ " from " ++ town -- don't in after let
    putStrLn msg
    -- cannot call putStrLn name ++ "safds" ++ town, because ++ has higher
    -- priority than putStrLn
    -- ($) :: (a -> b) -> a -> b
    putStrLn $ name ++ " comes from " ++ town

