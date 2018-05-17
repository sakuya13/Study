countNegatives :: [Int] -> Int
countNegatives [] = 0
countNegatives (x:xs) =
    if x < 0 then 1 + countNegatives xs
             else countNegatives xs

main =
    let x = product [1..] in
    print (countNegatives [1, x])


