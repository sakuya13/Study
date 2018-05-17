import System.Random
import Control.Monad.Trans.State

rollDie :: State StdGen Int
rollDie = do
    generator <- get -- Retrieve the current state of the RNG
    let (value, newGenerator) = randomR (1,6) generator 
    put newGenerator -- Update the state of the RNG
    return value -- Update the value stored in the state monad


twoRandomDice :: State StdGen (Int, Int)
twoRandomDice = do
    generator <- get -- Retrieve
    let (value1, tempGenerator) = randomR (1, 6) generator
        (value2, newGenerator) = randomR (1, 6) tempGenerator
    put newGenerator -- Update
    return (value1, value2)

threeRandomDice :: State StdGen (Int, Int, Int)
threeRandomDice = do
    val1 <- rollDie -- extract the value stored by "return value" in randomDie
    val2 <- rollDie
    val3 <- rollDie
    return (val1,val2,val3)


-- without using state monad
generator :: StdGen
generator = mkStdGen 0

nextRandomInt :: StdGen -> (Int, StdGen)
nextRandomInt gen = random gen

nextRandomIntInRange :: (Int, Int) -> StdGen -> (Int, StdGen)
nextRandomIntInRange bounds gen = randomR bounds gen

-- > let (randInt, gen1) = nextRandomInt generator 
-- > randInt
-- > let (randInt, gen2) = nextRandomInt gen1
-- > randInt
-- > ...


