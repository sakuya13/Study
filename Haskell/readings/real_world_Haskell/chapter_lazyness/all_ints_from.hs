-- [1..] is equivalent to all_ints_from
all_ints_from :: Integer -> [Integer]
all_ints_from n = n:(all_ints_from (n+1))

