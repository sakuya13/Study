def main():
    print('Enter the names of your friends:')
    name1 = input('Friend 1:')
    name2 = input('Friend 2:')
    name3 = input('Friend 3:')

    #Open file called friends.txt or create one
    myfile = open('Friend_test.txt', 'w')

    #write into the file friends_test.txt

    myfile.write(name1+'\n')
    myfile.write(name2+'\n')
    myfile.write(name3+'\n')

    #close the file
    myfile.close()
main()
