# Refrormatting data using a bash script
In the coursera course [Getting and Cleaning Data](https://www.coursera.org/learn/data-cleaning)
there is a question in the quiz of week 2 that addresses the issue of dealing with
data that has not been formatted in a way that allows for a straightforward import 
into R. While one can use Rs various tools for reading the data, an alternative is
to use a simple bash script with sed to turn the data file into a csv format. 
The data in question is given by [this file](https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for),
which contains 9 columns with a different number of white spaces as separator.
Note furthermore, that some negative values are not separated from the neighboring column.
Here are the first few lines of the data file.

 Weekly SST data starts week centered on 3Jan1990

                Nino1+2      Nino3        Nino34        Nino4
 Week          SST SSTA     SST SSTA     SST SSTA     SST SSTA
 03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
 10JAN1990     23.4-0.8     25.2-0.3     26.6 0.1     28.6 0.3
 17JAN1990     24.2-0.3     25.3-0.3     26.5-0.1     28.6 0.3

The following bash script removes the first three lines, inserts commas between every column
and finally collapses all white spaces. After the script has been run, the data can be read
into R by simply using the read.csv().

If you want to run the script on a linux box, save the original data file to a file called
'data5.txt'. Then, copy the code below in a file called 'format.sh' in the same directory as 'data5.txt'. 
Then, simply run
```console
$ chmod +x format.xh
$./format.sh
```
The file 'data5.txt' is the overwritten, being now in a csv format.


```bash
#!/bin/bash
# ===============================================
# =         bash script by A. Windisch          =
# =         andreas.windisch@yahoo.com          =
# = coursera course 'Getting and Cleaning Data' =
# = use sed to prepare unformatted data         =
# = for import in R using read.csv()            =
# ===============================================
#                May 2018
# ===============================================

#first, remove the first three lines of the file
#the original data is stored in "data5.txt
sed -e '1,3d' < data5.txt > tmp1.txt

#insert commas at the following positions
#note that the pattern is 10, 5, 10, 5
#in character distance

sed 's/./&,/10' < tmp1.txt > tmp2.txt
sed 's/./&,/20' < tmp2.txt > tmp1.txt
sed 's/./&,/25' < tmp1.txt > tmp2.txt
sed 's/./&,/35' < tmp2.txt > tmp1.txt
sed 's/./&,/40' < tmp1.txt > tmp2.txt
sed 's/./&,/50' < tmp2.txt > tmp1.txt
sed 's/./&,/55' < tmp1.txt > tmp2.txt
sed 's/./&,/65' < tmp2.txt > tmp1.txt

#finally, collapse all white spaces
cat tmp1.txt | tr -d " " > data5.txt

#delete temp files
rm tmp1.txt
rm tmp2.txt

#now, in R, just use read.csv("data5.txt")

```

