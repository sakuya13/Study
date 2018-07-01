argMax :: Ord b => (a -> b) -> [a] -> Int
argMax f l = snd maximum pairs -- maximum works on lexico order
    where fl = map f l -- this is the list after applying l
          pairs = zip fl [0..] -- indexing the list fl


