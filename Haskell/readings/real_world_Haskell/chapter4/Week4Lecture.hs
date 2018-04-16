
hypotenuse :: (Floating a) => [a] -> a
hypotenuse = sqrt . sum . (map (\x -> x^2))

-- hypotenuse' x = sqrt (sum (map square x))

