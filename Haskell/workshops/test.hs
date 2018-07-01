-- len, sum, sumsq
acc :: Num a => [a] -> (a,a,a)
acc lst = acc' lst (0,0,0)

acc' [] triple = triple
acc' (x:xs) (a,b,c) = acc' xs (a+1,b+x,c+x*x)

-- fold
acc1 :: Num a => [a] -> (a,a,a)
acc1 = foldr step (0,0,0)
    where
        step x (a,b,c) = (a+1,b+x,c+x*x)


argMax :: Ord b => (a -> b) -> [a] -> Int
argMax f l = snd $ maximum pairs
    where fl = map f l
          pairs = zip fl [0..]


-- count down and print
countDown :: Int -> IO ()
countDown n =
    if n >= 0
    then do
        putStrLn $ "now " ++ show n
        countDown (n-1)
    else do
        putStrLn "done"

foo :: IO Int
foo = do
    return ()
    return "123"
    return 1

-- show "abc" = "\"abc\""

foo1 :: Maybe String
foo1 = do
    x <- Just 3
    y <- Just "!"
    Just $ show x ++ y


marySue :: Maybe Bool
marySue = do
    x <- Just 9
    Just $ x > 8


