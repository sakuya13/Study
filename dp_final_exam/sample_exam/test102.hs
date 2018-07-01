-- Q3
-- We can distinguish different Units through defining it in the
-- algebraic type system. Wrap them up in the data constructor
-- to avoid the mixture. For example:
data Distance = Meter Double

meter_to_Distance :: Double -> Distance
meter_to_Distance m = Meter m

feet_to_distance :: Double -> Distance
feet_to_distance f = Meter (f*0.3048)

add_distances :: Distance -> Distance -> Distance
add_distances (Meter a) (Meter b) = Meter (a+b)


