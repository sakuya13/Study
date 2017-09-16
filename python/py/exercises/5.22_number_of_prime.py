NUMBER_OF_PRIME = 1000
PRIME_PER_LINE = 8
count = 0
number = 2

print("The first 1000 prime number")

while count < NUMBER_OF_PRIME:
    is_prime = True

    divisor = 2
    while divisor <= number/2:
        if number % divisor == 0:
            is_prime = False
            break
        divisor += 1
    if is_prime:
        count += 1
        print(format(number, "5d"), end = "")
        if count % PRIME_PER_LINE == 0:
            print()
    number += 1

