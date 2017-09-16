t1 = eval(input("Enter the temperature in Fahrenheit between -58 and 41: "))
v = eval(input("Enter the wind speed in miles per hour: "))
if t1 >= -58 and t1 <= 41 and v >= 2:
    t2 = 35.74 + 0.6215 * t1 - 35.75 * v ** 0.16 + 0.4275 * t1 * v ** 0.16
    print("The wind chill index is %.5f." % t2)
else:
    print("You entered wrong temperature and wind speed!")
    