myDrop :: Int -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n-1) (tail xs)

-- using guards, also don't need tail function
myDrop' :: Int -> [a] -> [a]
myDrop' n xs | n <= 0 = xs
myDrop' _ []          = []
myDrop' n (_:xs)      = myDrop' (n-1) xs



