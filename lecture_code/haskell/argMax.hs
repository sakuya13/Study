argMax :: Ord b => (a -> b) -> [a] -> Int
argMax f l = snd maximum pairs
    where fl = map f l
          pairs = zip fl [0..]


