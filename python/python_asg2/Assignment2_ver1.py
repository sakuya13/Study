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
def main():
    ## change this filename variable to point to the location of the csv file
    ## you are wishing to work with.  Use the small set (supplied on LMS) to
    ## test your functions.  Then move on to the large sets, when you are happy
    filename = 'CrimeDataSetDirty.csv'

    ## read_data returns a dictionary of dictionaries
    data = read_data(filename)

    ## Perform your functions calls here
    # Clean the data file
    _, cleaned_data = clean_data(data)

    # Count the rows in the data file
    num_of_row = len(cleaned_data)

    # Total number of Subdivisions examined in the data file
    # and the worst subdivision
    num_of_subdivision, worst_division = worst_area(cleaned_data)
    # print(num_subdivision)

    # Total number of Offence Categories
    num_of_type = len(mostActive(data))
    print(num_of_type)

    # The most active type of crime
    most_active = most_active_type(cleaned_data)
    # print(active_category[0])

    # Create a report in formatted in text output
    name = 'fatty'
    with open('report.txt', 'w') as txt_file:
        txt_file.write(generate_report(name, num_of_row, num_of_subdivision,
                                       num_of_type, worst_division[0],
                                       most_active[0]))
    # The worst area for crime
    print(worstCrime(data))
    print(worst_area(data))
    # worst_subdivision = worst_division[0]
    # print(worst_division[0])

############################
## Begins the application ##
############################

# Question 1 (Clean data)
def clean_data(data):
    '''
    clean the data which contains 'zero' or 'null' in the CrimeDataSet
    input dirty dataset and return the clean dataset and the total number
    of the cleaning attepmts
    '''
    count_dirty = 0
    new_dict = data
    for key in new_dict:
        for year in range(2002, 2012+1):
            if new_dict[key][str(year)] == 'zero':
                new_dict[key][str(year)] = '0'
                count_dirty += 1
            if new_dict[key][str(year)] == 'null':
                new_dict[key][str(year)] = '0'
                count_dirty += 1
            if int(new_dict[key][str(year)]) < 0:
                new_dict[key][str(year)] = '0'
                count_dirty += 1
    return count_dirty, new_dict

# Question 2 (Worst year)
def countCrimes(data, key):
    '''
    Input dataset and the year as key
    and return the summated crime number of that year
    TODO: can I modify the name of the function?
    '''
    sum_crime = 0
    for k in data:
        if data[k][key] != 'None':
            sum_crime += int(data[k][key])
    return sum_crime

def worst_year(data):
    '''
    Input dataset and return the year with the highest summated
    crime number
    '''
    worst = {}
    for year in range(2002, 2012+1):
        worst[str(year)] = countCrimes(data, str(year))
    sorted_worst = sorted(worst.items(), key=lambda t: t[1], reverse=True)
    return sorted_worst[0]

# Question 3 (Worst area)
# def subdivision(data):
#     '''
#     input dataset, output the set of all the statistical dividions or
#     subdivisions
#     '''
#     subdivision_set = set()
#     for key in data.keys():
#         subdivision_set.add(data[key]['Statistical Division or Subdivision'])
#     return subdivision_set

def worstCrime(data):
    '''
    input dataset, output the dictionary of the summated crime numbers for
    each division over the years
    '''
    # worst_area_dict = {}
    # for area in subdivision(data):
    #     for key in data.keys():
    #         if data[key]['Statistical Division or Subdivision'] == area:
    #             for year in range(2002, 2012+1):
    #                 if area in worst_area_dict:
    #                     worst_area_dict[area] += int(data[key][str(year)])
    #                 else:
    #                     worst_area_dict[area] = 0
    # return worst_area_dict

    worst_area_dict = {}
    for key in data:
        division_name = data[key]['Statistical Division or Subdivision']
        if division_name not in worst_area_dict:
            worst_area_dict[division_name] = 0
        for year in range(2002, 2012+1):
            worst_area_dict[division_name] += int(data[key][str(year)])
    return worst_area_dict

def worst_area(data):
    '''
    input dataset, output the total number of statistical divisions or
    subdivisions and the worst area for crime with the summated crime number
    '''
    worst_area_dict = worstCrime(data)
    count_area = len(worst_area_dict)
    the_worst_area = max(worst_area_dict, key=lambda k: worst_area_dict[k])
    return count_area, (the_worst_area, worst_area_dict[the_worst_area])

# Question 4 (Most active criminal activity)
# def crime_type(data):
#     '''
#     input dataset, optput the set of all types of crimes
#     '''
#     crime_type_set = set()
#     for key in data.keys():
#         crime_type_set.add(data[key]['Offence category'])
#     return crime_type_set

def mostActive(data):
    '''
    input dataset, output the dictionary of each crime type with the summated
    crime number over the years
    '''
    # crime_type_dict = {}
    # for types in crime_type(data):
    #     for key in data.keys():
    #         if data[key]['Offence category'] == types:
    #             for year in range(2002, 2012+1):
    #                 if types in crime_type_dict:
    #                     crime_type_dict[types] += int(data[key][str(year)])
    #                 else:
    #                     crime_type_dict[types] = 0
    # return crime_type_dict

    crime_type_dict = {}
    for key in data:
        crime_name = data[key]['Offence category']
        if crime_name not in crime_type_dict:
            crime_type_dict[crime_name] = 0
        for year in range(2002, 2012+1):
            crime_type_dict[crime_name] += int(data[key][str(year)])
    return crime_type_dict

def most_active_type(data):
    '''
    input dataset, output the most active type of crime with the summated
    crime number
    '''
    crime_type_dict = mostActive(data)
    active_crime_type = max(crime_type_dict, key=lambda k: crime_type_dict[k])
    return active_crime_type, crime_type_dict[active_crime_type]

# Question 5 (Tying it all together)
def generate_report(name, num_row, num_subdivision, num_type, worst_subdivision,
                    active_category):
    '''
    input name, number of rows, number of subdivision, number of crime types,
    the worst subdivision and the most active crime type, output the content
    of the analysis report
    '''
    return 'On behalf of the MUC (Made Up Company), I ' + name +\
        ', have analysed ' + str(num_row) + ' units of the crime statistics ' +\
        'data. This data covered ' + str(num_subdivision) + ' Subdivisions ' +\
        'and found ' + str(num_type) + ' types of crimes. ' +\
        'I conclude that the worst area for crime is ' + worst_subdivision +\
        ', and that the most active category of crime is ' + active_category +\
        '.'

main()
