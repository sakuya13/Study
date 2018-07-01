import Data.Char


-- Q1
maybe_tail :: [a] -> Maybe [a]
maybe_tail [] = Nothing
maybe_tail (_:xs) = Just xs

-- without maybe_tail
maybe_drop :: Int -> [a] -> Maybe [a]
maybe_drop n lst = if n > (length lst) 
                   then Nothing
                   else Just $ drop n lst


--TODO
maybe_drop1 :: Int -> [a] -> Maybe [a]
maybe_drop1 0 xs = Just xs
maybe_drop1 n xs 
    | n > 0 = let temp = maybe_tail xs
              in case temp of
                        Nothing -> Nothing
                        Just tail -> maybe_drop1 (n-1) tail
    
-- TODO (>>=) :: Monad m => m a -> (a -> m b) -> m b
maybe_drop2 :: Int -> [a] -> Maybe [a]
maybe_drop2 0 xs = Just xs
maybe_drop2 n xs | n > 0 = 
    maybe_tail xs >>= maybe_drop2 (n-1)

-- TODO: Nothing >>= Just will return Nothing

-- Q2
data Tree a = Empty | Node (Tree a) a (Tree a)


print_tree :: Show a => Tree a -> IO ()
print_tree Empty = return ()
print_tree (Node l i r) = do
    print_tree l
    print i
    print_tree r


-- Q3
str_to_num :: String -> Maybe Int
str_to_num [] = Nothing
str_to_num xs = foldl step (Just 0) xs
--    where step base x =
--            case base of
--                Nothing -> Nothing
--                Just acc -> if isDigit x then Just $ acc*10+(digitToInt x)
--                            else Nothing
    where 
        f x nums = if isDigit x then Just $ nums*10+(digitToInt x) else Nothing
        step base x =
            base >>= f x



-- Q4
read_sum :: IO Int
read_sum = do
    line <- getLine
    case str_to_num line of
        Nothing -> return 0
        Just num -> do
            sum <- read_sum
            return $ sum + num


read_sum1 :: IO Int
read_sum1 =
    getLine >>= 
    \line -> case str_to_num line of
                    Nothing -> return 0
                    Just num -> 
                        read_sum1 >>= 
                        \sum -> return $ sum + num


sum_lines :: IO Int
sum_lines = do
    list <- lines_list
    return $ sum list

lines_list :: IO [Int]
lines_list = do
    line <- getLine
    case str_to_num line of
        Nothing -> return []
        Just num -> do
            nums <- lines_list
            return $ num:nums


-- Q5













