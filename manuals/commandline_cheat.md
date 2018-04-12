###Directories
- **mkdir dirname**: new directory
- **cd dirname**: change directory
- **pwd**: show current directory
- **a="$PWD"**: save current directory to variable a
    - **echo $a**: show value of a
    - **cd $a**: to directory a
-```echo "alias aliasname='command'" >> ~/.bash_aliases && source ~/.bash_aliases```

###Files
- ```cp [file] [new_directory/file]```: copy
- ```rm [file]```: remove
    -```rm -rf```: remove directory
- ```ls```: list your files
    - ```ls -l```: list in long format
    - ```ls -a```: lists all files
- ```mv [file1] [file2]```: in same directory equals to rename
    - ```mv [file1] [new_directory/file2]``` move file to new directory
