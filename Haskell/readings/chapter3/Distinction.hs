-- file: ch03/Distinction.hs
-- two tuyples with elements of the same type have the same type
a = ("fat", "cat")
b = ("cat", "fat")
-- two algebraic data types have distinct types even if they are otherwise structurally equivalent
data Cat = Cat String String
data Fat = Fat String String

c = Cat "is" "cute"
d = Fat "is" "fat"

