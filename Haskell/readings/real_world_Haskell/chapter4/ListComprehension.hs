-- why both not working with xs = [10..1]
-- should use xs = [10,9..1]
qs [] = []
qs (x:xs) = qs [y | y <- xs, y<x]
            ++ [x]
            ++ [y | y <- xs, y==x]
            ++ qs [y | y <- xs, y>x]

qs' [] = []
qs' (x:xs) = little ++ [x] ++ big
    where little = qs' [l | l <- xs, l<x]
          big    = qs' [b | b <- xs, b>=x]

