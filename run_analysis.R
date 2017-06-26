##Load necesary pkgs
library(readr)
library(tidyr)
library(dplyr)


##1) Merge the training and the test sets to create one data set####
##### Common usage values==============================
#Load feature variable names tables
varnames <- read_table2("UCI HAR Dataset/features.txt",col_names = F, col_types = list("c","c"))
varnames <- unlist(varnames[,2],use.names = F)

##### Load Test dataset===================
#Load test dataset subject identifier
test_subjectid <- read_table2("UCI HAR Dataset/test/subject_test.txt", col_names = F, col_types = "i")
test_subjectid <- unlist(test_subjectid,use.names = F)
#Load test records activity label
test_activitylabel <- read_table2("UCI HAR Dataset/TEST/y_test.txt", col_names = F, col_types = "i")
test_activitylabel <- unlist(test_activitylabel, use.names = F)
#Load test dataset feature  values
test <- suppressMessages(suppressWarnings(read_table2("UCI HAR Dataset/test/X_test.txt", col_names = varnames)))
#Bind test records to test_subjectid and test_activitylabel
test <- cbind(subjectid=test_subjectid, test, activity=test_activitylabel)

##### Load train dataset====================
#Load train dataset subject identifier
train_subjectid <- read_table2("UCI HAR Dataset/train/subject_train.txt", col_names = F, col_types = "i")
train_subjectid <- unlist(train_subjectid,use.names = F)
#Load test records activity label
train_activitylabel <- read_table2("UCI HAR Dataset/train/y_train.txt", col_names = F, col_types = "i")
train_activitylabel <- unlist(train_activitylabel, use.names = F)

#Load training dataset feature values
train <- suppressMessages(suppressWarnings(
    read_table2("UCI HAR Dataset/train/X_train.txt", col_names = varnames)
))
#bind values to subject identifier
train <- cbind(subjectid=train_subjectid, train,activity=train_activitylabel)

#####Bind test and train datasets -----
HAR <- rbind(test,train)

##2) Extracts only the measurements on the mean and standard deviation for each measurement.####
meancols <- varnames[grep(pattern = "mean()",varnames)]
stdcols <- varnames[grep(pattern = "std()",varnames)]
HAR_mean_std <- HAR[c("subjectid",meancols,stdcols,"activity")]

##3) Uses descriptive activity names to name the activities in the data set ####
#####Load activity lables factor
activitylabels <- read_table2("UCI HAR Dataset/activity_labels.txt",col_names = F,col_types = "ic")
activitylabels <- unlist(activitylabels[,2],use.names = F)
activitylabels <- factor(activitylabels, levels = activitylabels)
#####Substitute activity variable integers for corresponding descriptive activity label
HAR <- activitylabels[HAR$activity]

##4)Appropriately labels the data set with descriptive variable names.####

...to be continued... 