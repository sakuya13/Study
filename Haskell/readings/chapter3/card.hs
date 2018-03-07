data Suit        = Heart | Spade | Diamond | Club
                   deriving Show
data Rank        = R2 | R3 | R4 | Jack | Queen | King | Ace
                   deriving Show
data Card        = Card Suit Rank
                   deriving Show
data JokerColour = Red | Black
                   deriving Show
data JCard       = NormalCard Suit Rank | JokerCard JokerColour
                   deriving Show

myCard = Card Heart R2
myJCard = JokerCard Red


