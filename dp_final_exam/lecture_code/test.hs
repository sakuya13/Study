countDown :: Int -> IO ()
countDown (-1) = putStrLn "Done"
countDown n = do
    print n -- cannot use putStrLn here
            -- putStrLn :: String -> IO ()
            -- print :: Show a => a -> IO ()
    countDown $ n - 1


-- TODO: correct ver.
countDown1 :: Int -> IO ()
countDown1 n
    | n < 0     = putStrLn "Done"
    | otherwise = do
         print n
         countDown $ n - 1

main :: IO ()
main = do
    putStrLn "Please input a string"
    len <- readlen
    putStrLn $ "The length of that string is " ++ show len

readlen :: IO Int
readlen = do
    str <- getLine
    return (length str)


takeWhile1 :: (a -> Bool) -> [a] -> [a]
takeWhile1 _ [] = []
takeWhile1 f (x:xs) 
    | f x       = x:takeWhile1 f xs
    | otherwise = takeWhile1 f xs

dropWhile1 :: (a -> Bool) -> [a] -> [a]
dropWhile1 _ [] = []
dropWhile1 f (x:xs)
    | f x       = dropWhile1 f xs
    | otherwise = x:dropWhile1 f xs


dropWhileEnd1 :: (a -> Bool) -> [a] -> [a]
dropWhileEnd1 p = foldr (\x xs ->
                            if p x && null xs
                            then []
                            else x:xs
                        ) []


