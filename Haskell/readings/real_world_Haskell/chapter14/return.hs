main :: IO ()
main = do
    putStrLn "Please input a string"
    len <- readlen
    putStrLn $ "The length of the string is " ++ show len -- show here convets Int to String

readlen :: IO Int
readlen = do
    str <- getLine
    return (length str)

