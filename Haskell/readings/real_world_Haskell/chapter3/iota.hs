iota :: (Num t, Ord t) => t -> [t]
iota n
    | n == 0    = []
    | n  > 0    = iota (n-1) ++ [n]
    | otherwise = error "fatiscat!"

iota' :: (Num t, Ord t) => t -> [t] 
iota' n
    | n == 0    = []
    | n >  0    = iotatr 1 n
    | otherwise = error "cat is cutest in the world!"
    where
        iotatr m n
            | m == n = [n]
            | m <  n = m : iotatr (m+1) n

