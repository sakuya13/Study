valid3 :: (Bool -> Bool -> Bool -> Bool) -> Bool
valid3 f
    = and [f p q r | p <- b, q <- b, r <-b]
      where
        b = [False, True]

