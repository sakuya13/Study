data LibraryItem = Book Integer String String
                 | Periodicals Integer String Freq
                   deriving Show
data Freq = Days Integer | Months Integer
            deriving Show

-- data Book' = Book' Integer String String
--             deriving Show
-- data Periodicals' = Periodicals' Integer String Freq
--                     deriving Show
-- data LibraryItem' = Book' | Periodicals'
--                     deriving Show

