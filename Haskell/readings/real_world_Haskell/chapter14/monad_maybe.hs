-- unwrap a
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b

-- flipped ver of unwrap a
-- (=<<) :: Monad m => (a -> m b) -> m a -> m b

wordCount = print . length . words =<< getContents

-- wrap a
-- return :: Monad m => a -> m a

-- monad ops for Maybe
data Maybe t = Just t
             | Nothing

return x       = Just x
(Just x) >>= f = f x
Nothing >>= _  = Nothing

-- monad ops for MaybeOK (not in the library)
data MaybeOK t = OK t
               | Error String

return x        = OK x
(OK x) >>= f    = f x
(Error m) >>= _ = Error m

