with open("path/to/file", "w") as outfile: 
    outfile.write("abc")

# error handling
try: 
    with open("path/to/file", "w") as outfile: 
        outfile.write("abc") 
except IOError: 
    print("Cannot write to the file !!!!")


with open("path/to/file", "r") as fi:
    fi.read()
