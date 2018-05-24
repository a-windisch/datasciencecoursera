#  coursera Getting and Cleaning Data
### code book for course project
### Andreas Windisch, andreas.windisch@yahoo.com
## 1. Data sets 


The data is derived from this set [1]. There are two data sets, Xtotal and Xtotalaverage.
- Dimensions Xtotal       :  10299 67 
- Dimensions Xtotalaverage:  6 67 


## 2. Variables - general description 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAccXYZ
tGravityAccXYZ
tBodyAccJerkXYZ
tBodyGyroXYZ
tBodyGyroJerkXYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccXYZ
fBodyAccJerkXYZ
fBodyGyroXYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
Mean: Mean value
Std: Standard deviation
## 3. Variables in 'Xtotal' 
-Variable:  tBodyAccMeanX 
--Column number:  1 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMeanY 
--Column number:  2 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMeanZ 
--Column number:  3 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccStdX 
--Column number:  4 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccStdY 
--Column number:  5 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccStdZ 
--Column number:  6 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMeanX 
--Column number:  7 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMeanY 
--Column number:  8 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMeanZ 
--Column number:  9 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccStdX 
--Column number:  10 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccStdY 
--Column number:  11 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccStdZ 
--Column number:  12 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMeanX 
--Column number:  13 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMeanY 
--Column number:  14 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMeanZ 
--Column number:  15 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkStdX 
--Column number:  16 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkStdY 
--Column number:  17 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkStdZ 
--Column number:  18 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMeanX 
--Column number:  19 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMeanY 
--Column number:  20 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMeanZ 
--Column number:  21 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroStdX 
--Column number:  22 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroStdY 
--Column number:  23 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroStdZ 
--Column number:  24 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMeanX 
--Column number:  25 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMeanY 
--Column number:  26 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMeanZ 
--Column number:  27 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkStdX 
--Column number:  28 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkStdY 
--Column number:  29 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkStdZ 
--Column number:  30 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMagMean 
--Column number:  31 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMagStd 
--Column number:  32 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMagMean 
--Column number:  33 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMagStd 
--Column number:  34 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMagMean 
--Column number:  35 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMagStd 
--Column number:  36 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMagMean 
--Column number:  37 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMagStd 
--Column number:  38 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMagMean 
--Column number:  39 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMagStd 
--Column number:  40 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMeanX 
--Column number:  41 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMeanY 
--Column number:  42 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMeanZ 
--Column number:  43 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccStdX 
--Column number:  44 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccStdY 
--Column number:  45 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccStdZ 
--Column number:  46 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkMeanX 
--Column number:  47 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkMeanY 
--Column number:  48 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkMeanZ 
--Column number:  49 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkStdX 
--Column number:  50 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkStdY 
--Column number:  51 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkStdZ 
--Column number:  52 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroMeanX 
--Column number:  53 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroMeanY 
--Column number:  54 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroMeanZ 
--Column number:  55 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroStdX 
--Column number:  56 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroStdY 
--Column number:  57 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroStdZ 
--Column number:  58 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMagMean 
--Column number:  59 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMagStd 
--Column number:  60 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyAccJerkMagMean 
--Column number:  61 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyAccJerkMagStd 
--Column number:  62 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroMagMean 
--Column number:  63 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroMagStd 
--Column number:  64 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroJerkMagMean 
--Column number:  65 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroJerkMagStd 
--Column number:  66 
--Range: [-1,1]
--Type : numeric

-Variable:  activity 
--Column number:  67 
standing sitting laying walking walkingdownstairs walkingupstairs 
--Type : character



## 4. Variables in 'Xtotalaverage' 


The variables in this data set are averaged for every activity.

-Variable:  tBodyAccMeanX 
--Column number:  1 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMeanY 
--Column number:  2 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMeanZ 
--Column number:  3 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccStdX 
--Column number:  4 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccStdY 
--Column number:  5 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccStdZ 
--Column number:  6 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMeanX 
--Column number:  7 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMeanY 
--Column number:  8 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMeanZ 
--Column number:  9 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccStdX 
--Column number:  10 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccStdY 
--Column number:  11 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccStdZ 
--Column number:  12 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMeanX 
--Column number:  13 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMeanY 
--Column number:  14 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMeanZ 
--Column number:  15 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkStdX 
--Column number:  16 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkStdY 
--Column number:  17 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkStdZ 
--Column number:  18 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMeanX 
--Column number:  19 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMeanY 
--Column number:  20 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMeanZ 
--Column number:  21 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroStdX 
--Column number:  22 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroStdY 
--Column number:  23 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroStdZ 
--Column number:  24 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMeanX 
--Column number:  25 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMeanY 
--Column number:  26 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMeanZ 
--Column number:  27 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkStdX 
--Column number:  28 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkStdY 
--Column number:  29 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkStdZ 
--Column number:  30 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMagMean 
--Column number:  31 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccMagStd 
--Column number:  32 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMagMean 
--Column number:  33 
--Range: [-1,1]
--Type : numeric

-Variable:  tGravityAccMagStd 
--Column number:  34 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMagMean 
--Column number:  35 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyAccJerkMagStd 
--Column number:  36 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMagMean 
--Column number:  37 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroMagStd 
--Column number:  38 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMagMean 
--Column number:  39 
--Range: [-1,1]
--Type : numeric

-Variable:  tBodyGyroJerkMagStd 
--Column number:  40 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMeanX 
--Column number:  41 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMeanY 
--Column number:  42 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMeanZ 
--Column number:  43 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccStdX 
--Column number:  44 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccStdY 
--Column number:  45 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccStdZ 
--Column number:  46 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkMeanX 
--Column number:  47 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkMeanY 
--Column number:  48 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkMeanZ 
--Column number:  49 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkStdX 
--Column number:  50 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkStdY 
--Column number:  51 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccJerkStdZ 
--Column number:  52 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroMeanX 
--Column number:  53 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroMeanY 
--Column number:  54 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroMeanZ 
--Column number:  55 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroStdX 
--Column number:  56 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroStdY 
--Column number:  57 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyGyroStdZ 
--Column number:  58 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMagMean 
--Column number:  59 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyAccMagStd 
--Column number:  60 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyAccJerkMagMean 
--Column number:  61 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyAccJerkMagStd 
--Column number:  62 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroMagMean 
--Column number:  63 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroMagStd 
--Column number:  64 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroJerkMagMean 
--Column number:  65 
--Range: [-1,1]
--Type : numeric

-Variable:  fBodyBodyGyroJerkMagStd 
--Column number:  66 
--Range: [-1,1]
--Type : numeric

-Variable:  activity 
--Column number:  67 
walking walkingupstairs walkingdownstairs sitting standing laying 
--Type : character



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
