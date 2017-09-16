print(format("Kilograms", "10s"), format("Pounds", ">10s"), \
    format("|", "3s"), format("Pounds", "10s"), format("Kilograms", ">10s"))
j = 20
for i in range(1, 20, 2):
    print(format(i, "<10d"), format(i * 2.2, "10.1f"), \
        format("|", "3s"), format(j, "<10d"), format(j * 0.45, "10.2f"))
    j += 5
# zip function, very useful
for i, j in zip(range(1, 20, 2), range(20, 66, 5)):
    print(format(i, "<10d"), format(i * 2.2, "10.1f"), \
        format("|", "3s"), format(j, "<10d"), format(j * 0.45, "10.2f"))

