#write a program to convert numeric grades to letter grades
#H1 all grades 80 and above(80 - 100)
#H2A all grades equal to and above 75 but below 80 (75-79)
#H2B all grades between grades(70-74)
#P all grades between (50 -69)
#F all grades below 50
#this example illustrates using the if elif for nesting

num = int(input ('enter the numeric grade:'))

if num >= 80:
    grade = 'H1'
elif num >=75 and num < 80:
    grade = 'H2A'
elif  num >=70 and num < 75:
    grade = 'H2B'
elif num >= 50 and num < 70:
    grade = 'P'
else:
    grade = 'F'

print('the letter grade for the number', num, 'is:', grade)
