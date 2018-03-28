transpose :: [[x]] -> [[x]]
transpose array = 
          let nempty [] = False
              nempty _  = True
          in
          if and (map nempty array) then
              map head array : transpose (map tail array)
          else []

transpose' array =
    if any null array then []
    else map head array : transpose' (map tail array)

transpose'' :: [[x]] -> [[x]]
transpose'' array =
    if and (map (\xs -> case xs of
                         [] -> False
                         _  -> True)
            array
           )
    then map head array : transpose'' (map tail array)
    else []

