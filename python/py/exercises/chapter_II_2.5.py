subtotal, gratuity_rate = \
    eval(input("Enter the subtotal and a gratuity rate: "))
gratuity = subtotal * gratuity_rate / 100
total = subtotal + gratuity
print("The gratuity is %.2f" % gratuity, "and the total is %.2f" % total)

    