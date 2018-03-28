-- find the penultimate element in list
penultimate :: [a] -> a
penultimate = last . init

-- find the element at index k in list, indext starts from 0
findK :: Int -> [a] -> a
findK k = last . take (k+1)

-- determin if list l is a palindrome
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = False
isPalindrome xs = reverse xs == xs


{-
 - Duplicate the elements in list xs, for example "duplicate [1,2,3]" would 
 - give the list [1,1,2,2,3,3]
 - Hint: The "concat [l]" function flattens a list of lists into a single list 
 - (You can see the function definition by typing ":t concat" into the 
 - interpreter. Perhaps try this with other variables and functions)
 -
 - For example: concat [[1,2,3],[3,4,5]] returns [1,2,3,3,4,5]
 -}
duplicate :: [a] -> [a]
duplicate [] = []
duplicate (x:xs) = x:x:duplicate xs

{-
 - Imitate the functionality of zip
 - The function "min x y" returns the lower of values x and y
 - "ziplike [1,2,3] ['a','b','c','d'] returns [(1,'a'),(2,'b'),(3,'c')]
 -}
--zipLike :: [a] -> [b] -> [(a,b)]
zipLike = undefined

-- Split a list l at element k into a tuple: the first part up to and including
-- k, the second part after k
-- for example "splitAtIndex 3 [1,1,1,2,2,2]" returns ([1,1,1],[2,2,2])
splitAtIndex :: Int -> [a] -> ([a],[a])
splitAtIndex _ [] = ([],[])
splitAtIndex n xs = (xss, yss)
    where
        xss = take n xs
        yss = drop n xs

-- Drop the element at index k in list l
-- for example "dropK 3 [0,0,0,1,0,0,0]" returns [0,0,0,0,0,0]
dropK :: Int -> [a] -> [a]
dropK _ [] = []
dropK n xs = dropK' n 0 xs
    where
        dropK' _ _ [] = []
        dropK' n m (y:ys)
            | n /= m    = y : dropK' n (m+1) ys
            | otherwise = dropK' n (m+1) ys

-- Extract elements between ith and kth element in list l. Including i, but not
-- k. For example, "slice 3 6 [0,0,0,1,2,3,0,0,0]" returns [1,2,3]
slice :: Int -> Int -> [a] -> [a]
slice _ _ [] = []
slice n m xs = slice' n m 0 xs
    where
        slice' _ _ _ [] = []
        slice' n m l (y:ys)
            | l >= n && l < m = y : slice' n m (l+1) ys
            | otherwise       = slice' n m (l+1) ys

-- Insert element x in list l at index k
-- For example, "insertElem 2 5 [0,0,0,0,0,0]" returns [0,0,0,0,0,2,0]
insertElem :: a -> Int -> [a] -> [a]
insertElem _ _ [] = []
insertElem x k ys = insertElem' x k 0 ys
    where
        insertElem' _ _ _ [] = []
        insertElem' x k n (z:zs)
            | n == k    = x : z : insertElem' x k (n+1) zs
            | otherwise = z : insertElem' x k (n+1) zs

-- Rotate list l n places left.
-- For example, "rotate 2 [1,2,3,4,5]" returns [3,4,5,1,2]
rotate = undefined

