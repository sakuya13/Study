-- (maximum value in the list, [replace all value with v in that list])
replace :: [Int] -> Int -> (Int,[Int])
replace [] _ = error "Empty list has no maximum value"
replace [x] v = (x, [v])
replace (x:xs) v = (m', v:xs') -- haskell never evaluate v in the call of replace
    where (m, xs') = replace xs v
          m' = max m x

replaceWithMax :: [Int] -> [Int]
replaceWithMax xs = xs'
    where (largest, xs') = replace xs largest 
    -- here when call replace reached
    -- the base case, haskell finally evaluate v (that is largest here) and
    -- replace every element in the list with the same value


