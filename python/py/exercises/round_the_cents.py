cost = eval((input("How much does it cost? ")))
r = 10 - (100 * cost) % 10
if r > 2:
    print("The price didn't change or was rounded down! Pay cash!") 
else:
    print("The price was rounded up! Pay card.")
