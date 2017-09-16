import math

print(format("Degree", "9s"), format("Sin", "9s"), format("Cos", "9s"))
for i in range(0, 361, 10):
    print(format(i, "<9d"), format(math.sin(i), "<9.4f"), format(math.cos(i), "<9.4f"))

