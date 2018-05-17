
recycle :: [t] -> [t]
recycle l = recycle'' l l

recycle'' [] l = recycle'' l l
recycle'' (x:xs) l = x:recycle'' xs l


recycle' l = l ++ recycle' l


-- try recycle [1..] 



