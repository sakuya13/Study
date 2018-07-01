import Data.Char
-- Q1
capitalises :: String -> String
capitalises = map toUpper


-- Q2
squareall :: [Int] -> [Int]
squareall = map (^2)


-- Q3
nestedreverse :: [String] -> [String]
nestedreverse = reverse . (map reverse)


-- Q4
atfront :: a -> [[a]] -> [[a]]
atfront x = map (x:)


-- Q5
lengths :: [String] -> [Int]
lengths = map length


-- Q6
parity :: [String] -> [Int]
parity = map (is_even . length)
    where is_even x = if (x `mod` 2) == 0 then 0
                      else 1

-- Q7
sumsq :: Int -> Int
sumsq n = sum $ map (^2) [1..n]


-- Q8 TODO
suffixes :: [a] -> [[a]]
suffixes [] = [[]]
suffixes lst@(x:xs) = lst:suffixes xs

subseqs1 :: [a] -> [[a]]
subseqs1 [] = [[]]
subseqs1 (x:xs) = (subseqs1 xs) ++ map (x:) (subseqs1 xs)


-- Q9
filter1 :: (a -> Bool) -> [a] -> [a]
filter1 p = concat . (map box)
    where box x = if p x then [x]
                  else []

-- Q10
without_capitals :: String -> String
without_capitals = filter (not . isUpper)


-- Q11 TODO without prime num
all_prime :: [Int]
all_prime = primes [2..]

primes :: [Int] -> [Int]
primes [] = []
primes (x:xs) = x:primes (filter (not . (`divisibleBy` x)) xs)

divisibleBy a b = a `mod` b == 0 

wp :: [Int] -> [Int]
wp = filter (not . prime)

auxprime :: Integral a => a -> a -> Bool
auxprime i 2 = i `rem` 2 == 0
auxprime i j = i `rem` j == 0 || auxprime i (j-1)

prime :: Integral a => a -> Bool
prime 1 = False
prime 2 = True
prime i = not (auxprime i (i-1))


-- Q12 without empty list
wtel :: [[a]] -> [[a]]
wtel = filter (not . null)


-- Q13 containing an even number
caen :: [[Int]] ->[[Int]]
caen = filter (any even)


-- Q14 at front of all even
afoae :: Int -> [[Int]] -> [[Int]]
afoae n = (map (n:)) . caon
    where caon = filter (all even)


-- Q15 without vowels
wvowel :: String -> String
wvowel = filter not_wvowel

not_wvowel x = x/='a' && x/='e' && x/='i' && x/='o' && x/='u'


-- Q16 
wiv :: [String] -> [String]
wiv = map (filter not_wvowel)


-- Q17 sum the squares of primes


