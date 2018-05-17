isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just _) = False

main = 
    let x = product [1..] in
    print $ isNothing (Just x)


