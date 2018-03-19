import Data.List

-- isolate :: [a] -> [[a]]
-- isolate [] = []
-- isolate (x:xs) = [[x]:isolate xs]

main = do
    thing <- getLine
    putStrLn $ "\n" ++ thing ++ " is fat"
    putStrLn "roast it!"


