#  coursera Getting and Cleaning Data          
###           course project                     
### Andreas Windisch, andreas.windisch@yahoo.com 

## 1. Files contained in this repository

- README.md - This file.
- run_analysis.R - the main R script, see description below.
- CodeBook.md -Contains a description of variables used in the data set

## 2. Short description of the project
Given this [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) [1] which contains cell phone sensor data of six different movement acitvities (standing, sitting, laying, walking, walking up, walking down). The data has been processed as follows. The test and training sets are merged, and only columns which contain means or stds are kept, together with the corresponding activity. A second data set is produced, which contains the averages of all the measurements with respect to the six different activities. 

## 3. The script file run_analysis.R
This is the main file that reads the data and processes it. The script can be used as follows. Download the data from the link above, and unzip it in a directory. Don't cd into the directory, but set the working directory in the script to the directory that now contains the unpacked directory called UCI HAR Dataset. After setting the working directory, the script can simply be executed. It will print statements describing each step, see Section 'Output of run_analysis.R' below. The script performs the following steps:

- Read in Xtrain.txt, Ytrain.txt, Xtest.txt, Ytest.txt
- Checks whether there are any NAs
- Checks and prints the dimensions of the data frames
- Adds the activities Y to the sets X by introducing a new column
- Reads in column names from file features.txt contained in zip file
- Extracts those columns which contain either a mean or std
- Disregards all other columns from Xtrain and Xtest
- Combines Xtrain and Xtest to Xtotal
- Reads activity names from file activity_labels.txt contained in zip file
- Changes the activity column by replacing the integer values with activity names
- Creates a new data set called Xtotalaverage which contains the averages of all measurements
- Polishes the data set column names by lowercasing where possible, removing underscores, etc.
- Creates a file CodeBook.md dynamically
- Produces concluding remarks with the names and dimensions of the data sets

## 4. The output of run_analysis.R
```R
---------------------------------------------
   Coursera 'Getting and Cleaning Data'
          course project R script
 A. Windisch, andreas.windisch@yahoo.com
               May 2018
---------------------------------------------
Setting wdir (change as required), loading data...Done.
---------------------------------------------
Checking dimensions, probing for NAs.
Dimensions Xtrain:  7352 561 
Dimensions Ytrain:  7352 1 
Dimensions Xtest :  2947 561 
Dimensions Ytest :  2947 1 
NAs in Xtrain    :  FALSE 
NAs in Ytrain    :  FALSE 
NAs in Xtest     :  FALSE 
NAs in Ytest     :  FALSE 
---------------------------------------------
Add activity columns Y to X.
Checking dimensions after binding.
Dimensions Xtrain:  7352 562 
Dimensions Xtest :  2947 562 
---------------------------------------------
Reading column (feature) names from feature.txt.
Extracting columns which contain mean or std.
Found  66 columns.
Appending activity column to relevant columns.
---------------------------------------------
Dropping irrelevant columns from Xtrain/test.
Checking dimensions after dropping columns.
Dimensions Xtrain:  7352 67 
Dimensions Xtest :  2947 67 
---------------------------------------------
Concatenating Xtrain/test.
Checking dimensions after concatenation.
Dimensions Xtotal :  10299 67 
Assigning column names to Xtotal.
---------------------------------------------
Reading activity names from activity_labels.txt.
Loading the plyr package (need mapvalues()).
Replacing activity values with activity names.
---------------------------------------------
Creating data frame Xtotalaverage.
Modifying column names and assigning to Xtotalaverage.
Computing averages.
---------------------------------------------
Polishing data sets Xtotal and Xtotalaverage.
Making activities all lower case.
Removing underscores in activities.
Removing '()' in column names.
Removing dashes in column names.
Changing mean/Mean std/Std in column names.
---------------------------------------------
Creating code book 'CodeBook.md'.
Code book 'CodeBook.md' created.
---------------------------------------------
Created data sets 'Xtotal', 'Xtotalaverage'.
Dimensions Xtotal       :  10299 67 
Dimensions Xtotalaverage:  6 67 
---------------------------------------------
End of script.
---------------------------------------------
```
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

