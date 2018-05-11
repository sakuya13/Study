data MaybeOK t = OK t
               | Error String
               deriving Show

maybe_head :: [a] -> MaybeOK a
maybe_head [] = Error "head of empty list"
maybe_head (x:_) = OK x 

maybe_sqrt :: Int -> MaybeOK Double
maybe_sqrt x = 
    if x >= 0 then 
        OK (sqrt(fromIntegral x)) -- fromIntegral converts Integer to any numeric type
    else 
        Error "sqrt of negative number"


-- without monad
maybe_sqrt_of_head :: [Int] -> MaybeOK Double
maybe_sqrt_of_head lst =
    let mh = maybe_head lst
    in case mh of 
        Error msg -> Error msg
        OK h      -> maybe_sqrt h


-- with monad
maybe_sqrt_of_head' :: [Int] -> MaybeOK Double
maybe_sqrt_of_head' lst =
    maybe_head lst >>= maybe_sqrt

