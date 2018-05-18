#!/bin/bash
# ===============================================
# =         bash script by A. Windisch          =
# =         andreas.windisch@yahoo.com          =
# = coursera course 'Getting and Cleaning Data' =
# = use sed to prepare unformatted data         =
# = for import in R using read.csv()            =
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


