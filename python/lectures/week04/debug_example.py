DEBUG = True

def debug(str):
    if(DEBUG):
        print(str)

debug("THIS IS WORKING")

DEBUG = False;

debug("THIS IS NOT WORKING")

print('fin')
