-- 1. Write your own “safe” definitions of the standard partial list functions,
-- but make sure they never fail.

import Data.Maybe

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast [x] = Just x
safeLast (_:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit [x] = Just []
safeInit (x:xs) = 
    Just $ x : case safeInit xs of
                Just ys -> ys
                Nothing -> []
                             
safeInit' :: [a] -> Maybe [a]
safeInit' [] = Nothing
safeInit' [x] = Just []
safeInit' (x:xs) =
    Just $ x : (fromMaybe [] (safeInit' xs))


-- myFromMaybe :: a -> Maybe a -> a
-- myFromMaybe x m =
--     case m of
--         Nothing -> x
--         Just y -> y

-- Q2
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith p (x:xs) =
    let (first, rest) = span p (x:xs)
    in
    if p x then first : splitWith p rest
    else splitWith p xs


