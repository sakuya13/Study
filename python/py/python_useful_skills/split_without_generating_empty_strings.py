import re 
s = " 1 2 \t    3     "    # an example string 
re.split(" +", s.strip(" "))
