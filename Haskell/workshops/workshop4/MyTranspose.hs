myTranspose :: [[a]] -> [[a]]
myTranspose array =
    if any null array then []
    else map head array : myTranspose (map tail array)




