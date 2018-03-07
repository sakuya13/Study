lend amount balance = let reserve    = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

lend2 :: (Ord t, Fractional t) => t -> t -> Maybe t 
lend2 amount balance = if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
    where reserve    = 100
          newBalance = balance - amount
          
