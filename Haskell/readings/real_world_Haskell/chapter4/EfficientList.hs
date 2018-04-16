-- to deal with the partial funcitons in Data.List
mySmartExample xs = if null xs
                    then 'Z'
                    else head xs

myOtherExample (x:_) = x
myOtherExample []    = 'Z'


