-- what is Bounded??
data Colour = Red | Orange | Yellow | Green | Blue | Indigo | Violet
              deriving (Eq, Ord, Show, Bounded, Enum)

firstColour :: Colour
firstColour = minBound

reverseColourOrder :: [Colour]
reverseColourOrder = reverse $ enumFrom Red

reverseColourOrder' :: [Colour]
reverseColourOrder' = reverse [Red .. Violet]

--reverseInt = reverse [1..10]
foo = let a = Red
          b = Violet
       in [a..b]


data LibraryItem = Book String Int | Periodical String Int

--data Rank = R1 | R2 | R3
--data Suite = 

--data Card = Card Suite Rank

paintMix :: Colour -> Colour -> Colour
paintMix c1 c2 = let a = fromEnum c1 
                     b = fromEnum c2
                 in toEnum $ quot (a+b) 2


