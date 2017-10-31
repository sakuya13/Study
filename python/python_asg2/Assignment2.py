'''
Author: Xiaowei Xu
This module is used to clean and analysis the noisy crime CSV data from 2002 to
2012, which is retrieved from data.gov.au/dataset. The cleaned data is processed
within the module to output the results of the statistical analysis of the crime
data.

Note that the functions within the areas of Question 2, 3 & 4 each includes a
helper function to display the result of the three. The overall result
is displayed both on the screen and in a text file called 'report.txt'.
'''
import csv # imports the needed csv functions

######################################
## ISYS90088 - Assignment 2         ##
## This file and functions are      ##
## designed to support the needs    ##
## of assignemt 2.                  ##
##                                  ##
## read_data                        ##
## reads the data from the CSV file ##
##                                  ##
## You need not worry about the     ##
## content of this function. use it ##
## As needed to complete your code. ##
######################################
def read_data(filename):
    data = {}
    new_data = {}
    with open(filename) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            ID = row["ID"]
            del row["ID"]
            for key in row:
                if not row[key]:
                    row[key] = None
            data[ID] = row
            new_data[ID] = dict(list(row.items()))
    return new_data

#########################################
## Main method, to call functions etc, ##
#########################################
def main(datafile='CrimeDataSetDirty.csv'):
    ## change this filename variable to point to the location of the csv file
    ## you are wishing to work with.  Use the small set (supplied on LMS) to
    ## test your functions.  Then move on to the large sets, when you are happy

    # According to the instructions, the main function takes a filename as an
    # argument. So I commented the following line and take
    # 'CrimeDataSetDirty.csv' as the default datafile.
    # filename = 'CrimeDataSetDirty.csv'

    ## read_data returns a dictionary of dictionaries
    data = read_data(datafile)

    ## Perform your functions calls here
    # Clean the data file
    count_cleaned, cleaned_data = clean_data(data)

    # print out Q1 result
    # print('The cleaned data:', cleaned_data)
    print('Q1 result: Number of data sample cleaned: ' + str(count_cleaned) +\
          '.')

    # print out Q2 result
    display_q2_result(cleaned_data)

    # print out Q3 result
    display_q3_result(cleaned_data)

    # print out Q4 result
    display_q4_result(cleaned_data)

    # Print out Q5 result
    name = 'fatty'
    # Count the rows in the data file
    num_of_row = len(cleaned_data)
    # Total number of Subdivisions examined in the data file
    num_of_subdivision = len(worstCrime(cleaned_data))
    # Total number of Offence Categories
    num_of_type = len(mostActive(cleaned_data))
    # The worst subdivision with its summated crime number
    worst_division = worst_area(cleaned_data)[0]
    # The most active type of crime with its summated crime number
    the_most_active = most_active_type(cleaned_data)[0]
    # Print out the report on the screen
    print('Q5 report:' + '\n' + generate_report(name, num_of_row,
                                                num_of_subdivision,
                                                num_of_type, worst_division,
                                                the_most_active))
    # Outputs a report in .txt file
    with open('report.txt', 'w') as txt_file:
        txt_file.write(generate_report(name, num_of_row, num_of_subdivision,
                                       num_of_type, worst_division,
                                       the_most_active))

############################
## Begins the application ##
############################

# Question 1 (Clean data)
def clean_data(data):
    '''
    Clean the data which contains 'zero', 'null' or negative value in the
    CrimeDataSet. Input dirty dataset and return the cleaned dataset and the
    total number of the cleaning attepmts
    '''
    count_dirty = 0
    new_dict = data
    for key in new_dict:
        for year in range(2002, 2012+1):
            crime_data = new_dict[key][str(year)]
            if crime_data == 'zero' or crime_data == 'null':
                new_dict[key][str(year)] = '0'
                count_dirty += 1
            elif crime_data is not None:
                try:
                    int_crime_data = int(crime_data)
                    if int_crime_data < 0:
                        new_dict[key][str(year)] = '0'
                        count_dirty += 1
                except ValueError:
                    print('Error! Please check the original data!')
    return count_dirty, new_dict

# Question 2 (Worst year)
def countCrimes(data, key):
    '''
    Input cleaned dataset and the year as key
    and return the summated crime number of that year
    '''
    sum_crime = 0
    for k in data:
        crime_data = data[k][key]
        if crime_data is not None:
            try:
                sum_crime += int(crime_data)
            except ValueError:
                print('Error! Please check the original data!')
    return sum_crime

def worst_year(data):
    '''
    Input cleaned dataset and return the year with the highest summated
    crime number
    '''
    worst_year_tally = {}
    for year in range(2002, 2012+1):
        worst_year_tally[str(year)] = countCrimes(data, str(year))
    the_worst_year = max(worst_year_tally, key=lambda k: worst_year_tally[k])
    # handling tie
    worst_year_value = worst_year_tally[the_worst_year]
    tied_worst_years = [year for year in worst_year_tally\
                            if worst_year_tally[year] == worst_year_value]
    return tied_worst_years, worst_year_value

def display_q2_result(data):
    '''
    The function takes cleaned dataset as input, it prints out the worst year(s)
    and the crime number of the year on the screen
    '''
    tied_worst_years, worst_year_value = worst_year(data)
    print('Q2 result: The worst year is/are ' +\
          ', '.join(tied_worst_years) + '.' +\
          ' The crime number for the year(s) is ' + str(worst_year_value) + '.')

# Question 3 (Worst area)
def worstCrime(data):
    '''
    Input cleaned dataset, output the dictionary of the summated crime numbers
    for each division over the years
    '''
    worst_area_tally = {}
    for key in data:
        subdivision = data[key]['Statistical Division or Subdivision']
        if subdivision not in worst_area_tally:
            worst_area_tally[subdivision] = 0
        for year in range(2002, 2012+1):
            crime_data = data[key][str(year)]
            if crime_data is not None:
                try:
                    worst_area_tally[subdivision] += int(crime_data)
                except ValueError:
                    print('Error! Please check the original data!')
    return worst_area_tally

def worst_area(data):
    '''
    Input cleaned dataset, output the total number of statistical divisions or
    subdivisions and the worst area for crime with the summated crime number
    '''
    worst_area_tally = worstCrime(data)
    the_worst_area = max(worst_area_tally, key=lambda k: worst_area_tally[k])
    # handling tie
    worst_area_value = worst_area_tally[the_worst_area]
    tied_worst_areas = [area for area in worst_area_tally\
                            if worst_area_tally[area] == worst_area_value]
    return tied_worst_areas, worst_area_value

def display_q3_result(data):
    '''
    Input cleaned dataset, output the result of the number of subdivisions, the
    worst area and the highest overall crime number on the screen
    '''
    num_of_subdivision = len(worstCrime(data))
    tied_worst_areas, the_worst_crime_value = worst_area(data)
    print('Q3 result: The number of Subdivisions is ' +\
          str(num_of_subdivision) + '.' +\
          ' The worst area is/are ' + ', '.join(tied_worst_areas) + '.' +\
          ' The highest overall crime number for the area(s) is ' +\
          str(the_worst_crime_value) + '.')

# Question 4 (Most active criminal activity)
def mostActive(data):
    '''
    Input cleaned dataset, output the dictionary of each crime type with the
    summated crime number over the years
    '''
    crime_type_tally = {}
    for key in data:
        crime_type = data[key]['Offence category']
        if crime_type not in crime_type_tally:
            crime_type_tally[crime_type] = 0
        for year in range(2002, 2012+1):
            crime_data = data[key][str(year)]
            if crime_data is not None:
                try:
                    crime_type_tally[crime_type] += int(crime_data)
                except ValueError:
                    print('Error! Please check the original data!')
    return crime_type_tally

def most_active_type(data):
    '''
    Input cleaned dataset, output the most active type of crime with the
    summated crime number
    '''
    crime_type_tally = mostActive(data)
    the_most_active = max(crime_type_tally, key=lambda k: crime_type_tally[k])
    # handling tie
    most_active_value = crime_type_tally[the_most_active]
    tied_most_active = [crime for crime in crime_type_tally\
                              if crime_type_tally[crime] == most_active_value]
    return tied_most_active, most_active_value

def display_q4_result(data):
    '''
    The function takes cleaned dataset as input, it prints out the worst crime
    type(s) and the crime number of the type on the screen
    '''
    tied_most_active, most_active_value = most_active_type(data)
    print('Q4 result: The worst crime type is/are ' +\
          ', '.join(tied_most_active) + '.' +\
          ' The crime number for the type(s) is ' +\
          str(most_active_value) + '.')

# Question 5 (Tying it all together)
def generate_report(name, num_row, num_subdivision, num_type, worst_subdivision,
                    active_category):
    '''
    Input name, number of rows, number of subdivision, number of crime types,
    the worst subdivision and the most active crime type, output the content
    of the analysis report
    '''
    return 'On behalf of the MUC (Made Up Company), I, ' + name +\
        ', have analysed ' + str(num_row) + ' units of the crime statistics ' +\
        'data. This data covered ' + str(num_subdivision) + ' Subdivisions ' +\
        'and found ' + str(num_type) + ' types of crimes. ' +\
        'I conclude that the worst area for crime is ' +\
        ', '.join(worst_subdivision) +\
        ', and that the most active category of crime is ' +\
        ', '.join(active_category) + '.'

main()
