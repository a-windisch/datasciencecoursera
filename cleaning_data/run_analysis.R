##################################################
##  coursera Getting and Cleaning Data          ##
##           course project                     ##
## Andreas Windisch, andreas.windisch@yahoo.com ##
##################################################

cat("\n")
cat("---------------------------------------------\n")
cat("   Coursera 'Getting and Cleaning Data'\n ")
cat("         course project R script\n")
cat(" A. Windisch, andreas.windisch@yahoo.com\n")
cat("               May 2018\n")
cat("---------------------------------------------\n")


##################################################
#         setting wdir and loading data          #
##################################################

cat("Setting wdir (change as required), loading data...")
setwd("/home/andreas/learning/Data_Science_Johns_Hopkins_University/03_Getting_and_Cleaning_Data/course_project")
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
cat("Done.\n")

##################################################
#    checking the dimensions of the tables       #
##################################################
cat("---------------------------------------------\n")
cat("Checking dimensions, probing for NAs.\n")
cat("Dimensions Xtrain: ", dim(Xtrain), "\n")
cat("Dimensions Ytrain: ", dim(Ytrain), "\n")
cat("Dimensions Xtest : ", dim(Xtest) , "\n")
cat("Dimensions Ytest : ", dim(Ytest) , "\n")
cat("NAs in Xtrain    : ", any(is.na(Xtrain)), "\n")
cat("NAs in Ytrain    : ", any(is.na(Ytrain)), "\n")
cat("NAs in Xtest     : ", any(is.na(Xtest)), "\n")
cat("NAs in Ytest     : ", any(is.na(Ytest)), "\n")

##################################################
#         add activity column Y to X             #
##################################################
cat("---------------------------------------------\n")
cat("Add activity columns Y to X.\n")
Xtrain <- cbind(Xtrain,Ytrain)
Xtest  <- cbind(Xtest,Ytest)
cat("Checking dimensions after binding.\n")
cat("Dimensions Xtrain: ", dim(Xtrain), "\n")
cat("Dimensions Xtest : ", dim(Xtest), "\n")

##################################################
#            read in column names                #
##################################################
cat("---------------------------------------------\n")
cat("Reading column (feature) names from feature.txt.\n")
columnnames <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
columnnames <- as.character(columnnames[,2])
cat("Extracting columns which contain mean or std.\n")
relevantcolumns <- grep("-mean\\(|-std\\(",columnnames)
columnnames <- columnnames[relevantcolumns]
cat("Found ", length(relevantcolumns), "columns.\n")
cat("Appending activity column to relevant columns.\n")
relevantcolumns <- append(relevantcolumns,562)
columnnames <- append(columnnames,"activity")


##################################################
#    pick relevant columns in Xtrain/Xtest       #
##################################################
cat("---------------------------------------------\n")
cat("Dropping irrelevant columns from Xtrain/test.\n")
Xtrain <- Xtrain[relevantcolumns]
Xtest  <- Xtest[relevantcolumns]
cat("Checking dimensions after dropping columns.\n")
cat("Dimensions Xtrain: ", dim(Xtrain), "\n")
cat("Dimensions Xtest : ", dim(Xtest), "\n")

##################################################
#        concatenating Xtrain and Xtest          #
##################################################
cat("---------------------------------------------\n")
cat("Concatenating Xtrain/test.\n")
Xtotal <- rbind(Xtrain,Xtest)
cat("Checking dimensions after concatenation.\n")
cat("Dimensions Xtotal : ", dim(Xtotal), "\n")
cat("Assigning column names to Xtotal.\n")
colnames(Xtotal) <- columnnames

##################################################
#        naming activities in the data set       #
##################################################
cat("---------------------------------------------\n")
cat("Reading activity names from activity_labels.txt.\n")
activitynames <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="")
activitynames$V1 <- as.character(activitynames$V1)
activitynames$V2 <- as.character(activitynames$V2)
cat("Loading the plyr package (need mapvalues()).\n")
library(plyr)
cat("Replacing activity values with activity names.\n")
Xtotal$activity <- as.character(Xtotal$activity)
Xtotal$activity <- mapvalues(Xtotal$activity,from=activitynames$V1,to=activitynames$V2)

##################################################
#         creating data set with averages        #
##################################################
cat("---------------------------------------------\n")
cat("Creating data frame Xtotalaverage.\n")
Xtotalaverage <- data.frame(matrix(nrow=6,ncol=67))
cat("Modifying column names and assigning to Xtotalaverage.\n")
columnnames[1:66] <- gsub("^","average\\(",columnnames[1:66])
columnnames[1:66] <- gsub("$","\\)",columnnames[1:66])
colnames(Xtotalaverage) <- columnnames
cat("Computing averages.\n")

walking <- Xtotal[which(Xtotal$activity=="WALKING"),]
Xtotalaverage[1,1:66] <- colMeans(walking[1:66])
Xtotalaverage[1,67] <- "WALKING"

walkingup <- Xtotal[which(Xtotal$activity=="WALKING_UPSTAIRS"),]
Xtotalaverage[2,1:66] <- colMeans(walkingup[1:66])
Xtotalaverage[2,67] <- "WALKING_UPSTAIRS"

walkingdn <- Xtotal[which(Xtotal$activity=="WALKING_DOWNSTAIRS"),]
Xtotalaverage[3,1:66] <- colMeans(walkingdn[1:66])
Xtotalaverage[3,67] <- "WALKING_DOWNSTAIRS"

sitting <- Xtotal[which(Xtotal$activity=="SITTING"),]
Xtotalaverage[4,1:66] <- colMeans(sitting[1:66])
Xtotalaverage[4,67] <- "SITTING"

standing <- Xtotal[which(Xtotal$activity=="STANDING"),]
Xtotalaverage[5,1:66] <- colMeans(standing[1:66])
Xtotalaverage[5,67] <- "STANDING"

laying <- Xtotal[which(Xtotal$activity=="LAYING"),]
Xtotalaverage[6,1:66] <- colMeans(laying[1:66])
Xtotalaverage[6,67] <- "LAYING"

##################################################
#  polishing data sets Xtotal and Xtotalaverage  #
##################################################
cat("---------------------------------------------\n")
cat("Polishing data sets Xtotal and Xtotalaverage.\n")
cat("Making activities all lower case.\n")
Xtotal$activity <- sapply(Xtotal$activity,tolower)
Xtotalaverage$activity <- sapply(Xtotalaverage$activity,tolower)
cat("Removing underscores in activities.\n")
Xtotal$activity <-  gsub("_","",Xtotal$activity )
Xtotalaverage$activity <-  gsub("_","",Xtotalaverage$activity)
cat("Removing '()' in column names.\n")
colnames(Xtotal) <- gsub("\\(\\)","",colnames(Xtotal))
colnames(Xtotalaverage) <- gsub("\\(\\)","",colnames(Xtotalaverage))
cat("Removing dashes in column names.\n")
colnames(Xtotal) <- gsub("-","",colnames(Xtotal))
colnames(Xtotalaverage) <- gsub("-","",colnames(Xtotalaverage))
cat("Changing mean/Mean std/Std in column names.\n")
colnames(Xtotal) <- gsub("mean","Mean",colnames(Xtotal))
colnames(Xtotalaverage) <- gsub("mean","Mean",colnames(Xtotalaverage))
colnames(Xtotal) <- gsub("std","Std",colnames(Xtotal))
colnames(Xtotalaverage) <- gsub("std","Std",colnames(Xtotalaverage))

##################################################
#              creating code book                #
##################################################
cat("---------------------------------------------\n")
cat("Creating code book 'CodeBook.md'.\n")
sink("CodeBook.md")
cat("#  coursera Getting and Cleaning Data\n")
cat("### code book for course project\n")
cat("### Andreas Windisch, andreas.windisch@yahoo.com\n")

cat("## 1. Data sets \n")
cat("\n\n")
cat("The data is derived from this set [1]. There are two data sets, Xtotal and Xtotalaverage.\n")
cat("- Dimensions Xtotal       : ", dim(Xtotal),"\n")
cat("- Dimensions Xtotalaverage: ", dim(Xtotalaverage),"\n")

cat("\n\n")

cat("## 2. Variables - general description \n")
cat("The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. \n")
cat("Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). \n")
cat("Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). \n")
cat("These signals were used to estimate variables of the feature vector for each pattern:  \n")
cat("'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  \n")
cat("-tBodyAccXYZ  \n")
cat("-tGravityAccXYZ  \n  ")
cat("-tBodyAccJerkXYZ  \n  ")
cat("-tBodyGyroXYZ  \n")
cat("-tBodyGyroJerkXYZ  \n")
cat("-tBodyAccMag  \n")
cat("-tGravityAccMag  \n")
cat("-tBodyAccJerkMag  \n")
cat("-tBodyGyroMag  \n")
cat("-tBodyGyroJerkMag  \n")
cat("-fBodyAccXYZ  \n")
cat("-fBodyAccJerkXYZ  \n")
cat("-fBodyGyroXYZ  \n")
cat("-fBodyAccMag  \n")
cat("-fBodyAccJerkMag  \n")
cat("-fBodyGyroMag  \n")
cat("-fBodyGyroJerkMag  \n")
cat("  \n")
cat("The set of variables that were estimated from these signals are: \n")
cat("Mean: Mean value  \n")
cat("Std: Standard deviation  \n")


cat("## 3. Variables in 'Xtotal' \n")
ct <- 1L

for( i in colnames(Xtotal)){
   cat("-Variable: ", i, "  \n")
   cat("--Column number: ", ct, "  \n")
   if( i != "activity"){
      cat("--Range: [-1,1]  \n")
      cat("--Type : numeric  \n  \n")
   } else {
      cat("--Range: ",unique(Xtotal$activity),"  \n")
      cat("--Type : character  \n  \n") 
   }
   ct <- ct + 1
}

cat("  \n  \n")
cat("## 4. Variables in 'Xtotalaverage'  \n")
cat("  \n  \n")
ct <- 1L
cat("The variables in this data set are averaged for every activity.  \n  \n")
for( i in colnames(Xtotal)){
   cat("-Variable: ", i, "  \n")
   cat("--Column number: ", ct, "  \n")
   if( i != "activity"){
      cat("--Range: [-1,1]  \n")
      cat("--Type : numeric  \n  \n")
   } else {
      cat("--Range: ", unique(Xtotalaverage$activity),"  \n")
      cat("--Type : character  \n  \n") 
   }
   ct <- ct + 1
}
cat("  \n  \n")
cat("[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.\n")
cat("Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.\n") 
cat("International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012\n")
sink()
cat("Code book 'CodeBook.md' created.\n")

##################################################
#               concluding remarks               #
##################################################
cat("---------------------------------------------\n")
cat("Created data sets 'Xtotal', 'Xtotalaverage'.\n")
cat("Dimensions Xtotal       : ", dim(Xtotal),"\n")
cat("Dimensions Xtotalaverage: ", dim(Xtotalaverage),"\n")
cat("---------------------------------------------\n")
cat("End of script.\n")
cat("---------------------------------------------\n")






