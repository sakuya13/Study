population = int(input("Enter current population: "))
years = int(input("Enter years for prediction: "))
# 5 added to population every 1 minute, that is 3600 added per day.
projection = population + 300 * 24 * 365 * years
print("The population after", years, "years will be:", projection)

