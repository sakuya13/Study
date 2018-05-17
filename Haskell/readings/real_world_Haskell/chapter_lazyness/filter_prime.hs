allPrimes :: [Integer]
allPrimes = primeFilter [2..]

primeFilter :: [Integer] -> [Integer]
primeFilter [] = []
primeFilter (x:xs) =
    x:primeFilter (filter (not . (`divisibleBy` x)) xs)

divisibleBy :: Integer -> Integer -> Bool 
divisibleBy n d = n `mod` d == 0

