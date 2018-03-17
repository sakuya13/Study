myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs) =
    if f x then x:fxs else fxs
    where fxs = myFilter f xs

isEven :: Int -> Bool
isEven x = if x `mod` 2 == 0 then True else False

isPos :: Int -> Bool
isPos x = if x > 0 then True else False


