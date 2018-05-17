filter_map :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filter_map _ _ [] = []
filter_map f m (x:xs) =
    let newxs = filter_map f m xs in
    if f x 
    then (m x):newxs 
    else newxs

one_pass xs = filter_map is_even triple xs -- one list traversal
two_pass xs = map triple (filter is_even xs) -- two list traversal


-- TODO: deforestration of map and foldl?
four_pass_stddev :: [Double] -> Double -- traverse the xs 3 times, sq of xs 1 time
four_pass_stddev xs =
    let count = fromIntegral (length xs)
        sum = foldl (+) 0 xs
        sumsq = foldl (+) 0 (map square xs)
    in (sqrt (count * sumsq - sum * sum)) / count

-- one traverse ver
data StddevData = SD Double Double Double

one_pass_stddev :: [Double] -> Double
one_pass_stddev xs =
    let init_sd = SD 0.0 0.0 0.0
        update_sd (SD c s sq) x =
            SD (c + 1.0) (s + x) (sq + x*x)
        SD count sum sumsq =
            foldl update_sd init_sd xs
    in (sqrt (count * sumsq - sum * sum)) / count


