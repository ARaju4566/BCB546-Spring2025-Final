# How to inspect your data using unix

## Before you put your data through any script, you should view its contents


### For large files use:
$ less "enter data file here"


### For smaller files use:

$ cat "enter data file here"


### If you want to view the top and bottom of a large file use the following: 
#### the -n flag allows you to choose how many rows are viewed for both commands

$ head "enter data file here"


$ tail -n 6 "enter data file here"


You can also pipe other sorting commands into the commands mentioned above:

### Select columns
$ cut -f1,4 "enter data file here" | head

### Create columns that look like a table from a csv/tsv file

$ column -s, "enter csv file here" | head




If you would like to find more useful commands you can find many tutorials online such as this one: https://linuxjourney.com/
