-- import Data.List
-- returns the (infinite list of all primes
all_primes :: [Integer]
all_primes = prime_filter [2..]

prime_filter :: [Integer] -> [Integer]
prime_filter [] = []
prime_filter (x:xs) =
    x:prime_filter (filter (not . (`divisibleBy` x)) xs)

-- n is evenly dividible by d
divisibleBy n d = n `mod` d == 0


-- take 10 all_primes  -- find first 10 primes
-- takeWhile (<= 10) all_primes  -- find all primes smaller and equal to 10



-- Quiz: generate an infinite list of repetitions of the elements of its input
recycle :: [t] -> [t]
recycle l = recycle' l l

recycle' [] l = recycle' l l 
recycle' (x:xs) l = x:recycle' xs l


-- Quiz:TODO 
-- what is its complexity if sort is using quicksort?
-- min = head . sort
-- quadratic (worst case), linear in the best and average cases
--
-- max = head . reverse . sort
-- quadratic (worst case), O(nlogn) in the best and average cases
--

