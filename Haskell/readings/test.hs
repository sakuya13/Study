factorial :: Integer -> Integer
factorial n 
    | n < 0     = error "stupid"
    | n < 2     = 1
    | otherwise = n * factorial (n - 1)

magicNumber :: Integer
magicNumber = 42

magicList = [1,3..]


