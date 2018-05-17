import System.IO.Unsafe

sum' :: Int -> Int -> Int
sum' x y = unsafePerformIO $ do
    putStrLn ("summing " ++ (show x) ++ " and " ++  (show y) )
    return (x+y)

