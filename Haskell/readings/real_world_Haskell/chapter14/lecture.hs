countDown :: Int -> IO ()
countDown n 
    | n > 0 = p



--return :: a -> [a]
--return x = [x]

bind :: [a] -> (a -> [b]) -> [b]
bind xs f = concatMap f xs

value2 :: [(Int,Int)]
value2 = do
    x <- [1,2,3]
    y <- [4,5,6]
    return (x,y)

value2' = [ (x,y) | x <- [1,2,3], y <- [4,5,6] ]

 
