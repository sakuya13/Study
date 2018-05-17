-- lazyness: to evaluate x dont need to evaluate y
pureFunction :: Int -> Int
pureFunction x =
    let y = putStrLn "Hello" in
    x + 1

length1 :: [a] -> Int
length1 l = go l 0
    where go [] acc = acc
          go (x:xs) acc = go xs (acc+1)

main = 
    let x = product [1..] in
    print (length1 [1, x])

