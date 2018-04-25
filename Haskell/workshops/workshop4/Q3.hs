generateStat :: Num a => [a] -> (Int,a,a)
--generateStat [] = (0,0,0)
generateStat list = (len, sl, sql)
    where len = length list
          sl = foldl (+) 0 list
          sql = foldr ((+) . (^2)) 0 list

generateStat' :: Num a => [a] -> (Int,a,a)
generateStat' [] = (0,0,0)
generateStat' (x:xs) =
    let (l, s, sq) = generateStat' xs
    in (l+1, s+x, x*x+sq)


