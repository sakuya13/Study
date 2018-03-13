import Data.Function
import Data.List
-- 1. Write a function that computes the number of elements in a list. To test 
-- it, ensure that it gives the same answers as the standard length function.

len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs

-- 3. Write a function that computes the mean of a list, i.e., the sum of 
-- all elements in the list divided by its length. (You may need to use the 
-- fromIntegral function to convert the length of the list from an integer 
-- into a floating-point number.)

mean' :: (Fractional t) => [t] -> t
mean' xs 
    | null xs        = error "no elements"
    | otherwise      = sum' xs / fromIntegral (length xs) 

sum' :: (Num t) => [t] -> t
sum' [] = 0
sum' (y:ys) = y + sum' ys

-- 4. Turn a list into a palindrome; i.e., it should read the same both 
-- backward and forward. For example, given the list [1,2,3], your function 
-- should return [1,2,3,3,2,1].

palin :: [t] -> [t]
palin zs = append zs (myReverse zs)

append :: [t] -> [t] -> [t]
append [] xs = xs
append (y:ys) xs = y : append ys xs

myReverse :: [t] -> [t]
myReverse xs = rReverse xs []

rReverse :: [t] -> [t] -> [t]
rReverse [] temp = temp
rReverse (y:ys) temp = rReverse ys (y:temp)

-- 5. Write a function that determines whether its input list is a palindrome.

isPalin :: (Eq t) => [t] -> Bool
isPalin xs
    | null xs            = True
    | xs == myReverse xs = True
    | otherwise          = False

-- 6. Create a function that sorts a list of lists based on the length of 
-- each sublist. (You may want to look at the sortBy function from 
-- the Data.List module.)

sortList :: (Ord t) => [[t]] -> [[t]]
sortList xs = sortBy (compare `on` length) xs

-- 7. Define a function that joins a list of lists together using
-- a separator value.

interesperse :: t -> [[t]] -> [t]
interesperse _ [] = []
interesperse _ [x] = x
interesperse a (x:xs) = x ++ [a] ++ interesperse a xs
-- interesperse a (x:xs)
--     | length (x:xs) == 1 = x
--     | length (x:xs) > 1 = x ++ [a] ++ interesperse a xs
--     | otherwise         = []

foo _ [] = []
foo _ [x] = x
foo a (x:xs) =
    case x of
        []     -> a : foo a xs
        (y:ys) -> y : foo a (ys:xs)

-- foo' a ((x:xs):xss)
-- foo' a ([]:xss) 

-- 9. Using the binary tree type that we defined earlier in this chapter,
-- write a function that will determine the height of the tree. The height is 
-- the largest number of hops from the root to an Empty. For example,
-- the tree Empty has height zero; Node "x" Empty Empty has height one;
-- Node "x" Empty (Node "y" Empty Empty) has height two; and so on.

data Tree t = Node t (Tree t) (Tree t)
            | Empty

treeHeight :: Tree t -> Int
treeHeight Empty = 0
treeHeight (Node x l r)
    | lHeight > rHeight = lHeight + 1
    | otherwise         = rHeight + 1
    where lHeight = treeHeight l
          rHeight = treeHeight r

-- 10. Consider three two-dimensional points, a, b, and c. If we look at 
-- the angle formed by the line segment from a to b and the line segment 
-- from b to c, it turns left, turns right, or forms a straight line. 
-- Define a Direction data type that lets you represent these possibilities.

data Direction = Left | Right | Straight
                 deriving Show
-- 11. Write a function that calculates the turn made by three 
-- two-dimensional points and returns a Direction.









