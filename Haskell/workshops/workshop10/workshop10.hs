import Data.Char

-- Q1
maybe_tail :: [a] -> Maybe [a]
-- maybe_tail [] = Just []
maybe_tail [] = Nothing
maybe_tail (_:xs) = Just xs

maybe_drop :: Int -> [a] -> Maybe [a]
maybe_drop _ [] = Nothing
maybe_drop 0 ys = Just ys
maybe_drop n (x:xs) =
    let mt = maybe_tail (x:xs)
    in case mt of
         Nothing -> Nothing
         Just xs -> maybe_drop (n-1) xs

maybe_drop' :: Int -> [a] -> Maybe [a]
maybe_drop' _ [] = Nothing
maybe_drop' 0 ys = Just ys
maybe_drop' n (x:xs) =
    maybe_tail (x:xs) >>= maybe_drop' (n-1)


-- Q2 What are the advantages and disadvantages of this approach compared
-- to traversing the tree and returning a string, and then printing the string?
data Tree a = Empty | Node (Tree a) a (Tree a)

print_tree :: Show a => Tree a -> IO ()
print_tree Empty = return ()
print_tree (Node l a r) = do
    print_tree l
    print a
    print_tree r


-- Q3 TODO:
str_to_sum :: String -> Maybe Int
str_to_sum [] = Nothing
str_to_sum st = str_to_sum_0 0 st

str_to_sum_0 :: Int -> String -> Maybe Int
str_to_sum_0 val [] = Just val
str_to_sum_0 val (d:ds) =
    if isDigit d
    then str_to_sum_0 (val*10 + digitToInt d) ds
    else Nothing

-- Q4
-- with do block
read_and_sum :: IO Int
read_and_sum = do
    line <- getLine
    case str_to_sum line of
      Nothing -> return 0
      Just num -> do
          sum <- read_and_sum
          return (num+sum)

-- withouth do block
read_and_sum' :: IO Int
read_and_sum' =
    getLine
    >>=
        \line -> case str_to_sum line of
               Nothing -> return 0
               Just num ->
                   read_and_sum'
                   >>=
                        \sum -> return (num+sum)



