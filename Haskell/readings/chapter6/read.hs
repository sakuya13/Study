main = do
         putStrLn "Please enter a Double:"
         inStr <- getLine
         let inpDouble = read inStr :: Double
         putStrLn ("Twice" ++ show inpDouble ++ " is " ++ show (inpDouble * 2))
        

