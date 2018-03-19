suffexes :: [a] -> [[a]]
suffexes [] = []
suffexes xs@(_:ys) = xs : suffexes ys

-- eq ver.
suffexes' [] = []
suffexes' (x:xs) = (x:xs) : suffexes' xs

