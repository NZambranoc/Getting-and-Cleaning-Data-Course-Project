##Load necesary pkgs
library(readr)
library(tidyr)
library(dplyr)
#------------------Common usage values---------------
#Load feature variable names tables
varnames <- read_table2("UCI HAR Dataset/features.txt",col_names = F, col_types = list("c","c"))
varnames <- unlist(varnames[,2],use.names = F)
#Load activity lables factor
activitylabels <- read_table2("UCI HAR Dataset/activity_labels.txt",col_names = F,col_types = "ic")
activitylabels <- unlist(activitylabels[,2],use.names = F)
activitylabels <- factor(activitylabels, levels = activitylabels)



#------------------------Load Test dataset-----------------------------
#Load test dataset subject identifier
test_subjectid <- read_table2("UCI HAR Dataset/test/subject_test.txt", col_names = F, col_types = "i")
test_subjectid <- unlist(test_subjectid,use.names = F)
#Load test records activity label
test_activitylabel <- read_table2("UCI HAR Dataset/TEST/y_test.txt", col_names = F, col_types = "i")
test_activitylabel <- unlist(test_activitylabel, use.names = F)

#Load test dataset feature  values
test <-
    suppressMessages(suppressWarnings(
        read_table2("UCI HAR Dataset/test/X_test.txt", col_names = varnames)
    ))


#Bind test records to test_subjectid and test_activitylabel
test <- cbind(test_subjectid, test, activitylabels[test_activitylabel])

#------------------------Load train dataset--------------------------
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
train <- cbind(train_subjectid, train,activitylabels[train_activitylabel])

#------
adsadssda

