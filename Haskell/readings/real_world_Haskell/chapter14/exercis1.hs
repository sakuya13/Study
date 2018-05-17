import System.Random
import Control.Monad.Trans.State

type RandomState a = State StdGen a

getRandom :: Random a => RandomState a
getRandom = do
    gen <- get
    let (val, gen') = random gen
    put gen'
    return val

-- liftM2 :: Monad m => (a1 -> a2 -> r) -> m a1 -> m a2 -> m 
-- getTwoRandoms :: Random a => RandomState (a, a)
-- getTwoRandoms = liftM2 (,) getRandom getRandom


getTwoRandoms' :: Random a => RandomState (a, a)
getTwoRandoms' = do
    val1 <- getRandom
    val2 <- getRandom
    return (val1, val2)

generate :: [(Int, Int)] -- list is a Monad
generate = do
    a <- [1,2,3]
    b <- [4,5,6]
    return (a ,b)


foo :: Maybe (Int,Int) -- Maybe is a Monad
foo = do
    a <- Just 42
    b <- Just 24
    return (a,b)

