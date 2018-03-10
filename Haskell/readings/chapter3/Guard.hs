fromMaybe defval wrapped =
    case wrapped of
        Nothing    -> defval
        Just value -> value

apple = "apple"
orange = "orange"

data Fruit = Apple | Orange
             deriving (Show)

whichFruit :: String -> Fruit

whichFruit f = case f of 
                 "apple"  -> Apple
                 "orange" -> Orange


