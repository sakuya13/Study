myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f xs = [f e | e <- xs]

-- plusOne = (+1)
plusOne :: Num a => a -> a

-- map (+1)
mapPlusOne :: Num a => [a] -> [a]


