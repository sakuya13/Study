sum1a :: Num a => [a] -> a
sum1a [] = 0
sum1a (x:xs) = x + sum1a xs

sum1b :: Num a => [a] -> a
sum1b xs = sum1b' xs 0
    where sum1b' []     acc = acc
          sum1b' (x:xs) acc = sum1b' xs (acc + x)


-- :t `seq` :: a -> b -> b
-- ask Haskell to evaluate the function straight away
-- faster but use similar amount of ram
sum2 :: Num a => [a] -> a
sum2 xs = sum2' xs 0
    where sum2' [] acc     = acc
          sum2' (x:xs) acc =
              let newacc = acc + x in
                  newacc `seq` sum2' xs newacc

-- TODO: parse error???
sum3 :: Num a => [a] -> a
sum3 xs = sum3' xs 0
    where sum3' []     !acc = acc
          sum3' (x:xs) !acc = sum3' xs (acc + x)

