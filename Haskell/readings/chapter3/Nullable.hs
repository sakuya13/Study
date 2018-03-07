-- parameterized types
-- data Maybe a = Just a
--              | Nothing
someBool = Just True
someString = Just "something"
-- nest uses of parameterized types
wrapped = Just (Just "wrapped")

