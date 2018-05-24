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
setwd("YOUR WDIR HERE, SEE README.md")
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
cat("Loading the plyr package (need mapvalues()).")
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
#               concluding remarks               #
##################################################
cat("---------------------------------------------\n")
cat("Created data sets 'Xtotal', 'Xtotalaverage'.\n")
cat("Dimensions Xtotal       : ", dim(Xtotal),"\n")
cat("Dimensions Xtotalaverage: ", dim(Xtotalaverage),"\n")
cat("---------------------------------------------\n")
cat("End of script.\n")
cat("---------------------------------------------\n")






