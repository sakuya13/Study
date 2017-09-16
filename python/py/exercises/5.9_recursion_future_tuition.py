fee = eval(input("Enter the tuitionFee now: "))
year = eval(input("Enter the years you want to predict: "))

def tuition_fee(fee, year):
    if year == 0:
        return fee
    elif year < 0:
        print("Error!!!")
    else:
        return tuition_fee(fee, year - 1) * 1.05

print("The tuition fee after", year, "years is $", end = "")
print(format(tuition_fee(fee, year), "8.2f"))

