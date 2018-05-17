import System.Random

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
