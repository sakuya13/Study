import Data.Char (toUpper)

square :: [Double] -> [Double]
square [] = []
square (x:xs) = x*x : square xs


upperCase :: String -> String
upperCase [] = []
upperCase (x:xs) = toUpper x : upperCase xs

-- variable names are omitted here!
square' = map sq
    where sq x = x*x

upperCase' = map toUpper

myMap :: (a -> b) -> [a] -> [b]
myMap f (x:xs) = f x : myMap f xs
myMap _ _ = []
-- myMap _ [] = []


