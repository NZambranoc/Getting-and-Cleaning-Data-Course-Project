##Load necesary pkgs
library(readr)
library(reshape2)
library(dplyr)

rm(list=ls())

##Step Printer Function

step <- function(...){
    cat("[run_analysis.R]: ",...,"\n",sep = "")
}

##Codebook Generator
codebook <- function(...){
    cat(..., "\n",file="./CodeBook.md",append=TRUE, sep="")}
file.remove("./CodeBook.md")
step("Initializing Session Codebook")
codebook("# Peer Reviewed Assignment Code Book")
codebook("generated ",as.character(Sys.time())," during sourcing of `run_analysis.R`")
codebook("")

codebook("## Actions performed on data:")

#Identify UCI HAR Dataset Directory data files ignoring "Inertial Signals" folders
DatasetDir <- "UCI HAR Dataset"
dirList <- list.files(DatasetDir,recursive = T)
FilesDirList <- dirList[grepl("(_test|_train)",dirList) & !grepl("Inertial Signals",dirList)]


codebook("* merging all test  and training datasets files into one dataset: `completeData`")
# Load all train & test .txt files into memory
step("loading .txt files:")
for(File in FilesDirList){
    tablename <- paste0("data_",sub("^.*/(.*)\\..*$","\\1",File))
    datafile <- file.path(DatasetDir,File)
    table <- read.table(datafile)
    assign(tablename,table)
    step("\t- \"",datafile,"\" loaded to var \"",tablename,"\"")
    rm(table)
}

##1) Merge the training and the test sets to create one data set####
step("[1] Merging the training and the test sets to create one data set.")

#Combine all _test and _train dataset pairs by row
keyCols <- character() #Vector containing key vars col names

step("\t- Combining test& train subjects sets")
data_subject <- rbind(data_subject_test,data_subject_train)
names(data_subject) <- "subject"
keyCols <- c(keyCols,names(data_subject))
rm(data_subject_test)
rm(data_subject_train)

step("\t- Combining test & train subject sets")
data_y <- rbind(data_y_test,data_y_train)
names(data_y) <- "activity_id"
keyCols <- c(keyCols,names(data_y))
rm(data_y_test)
rm(data_y_train)

step("\t- Combining test & train features sets")
data_x <- rbind(data_X_test,data_X_train)
featureFile <- file.path(DatasetDir,"features.txt")
featureNames <- read.table(featureFile)[,2]
names(data_x) <- featureNames
rm(data_X_test)
rm(data_X_train)
rm(featureNames)

#Combine all Columns of the row-combined datasets into a single one
step("\t- Combining subject, activity & features datasets")
completeData <- cbind(data_subject,data_y, data_x)


step("\t - \"completeData\" loaded in memory: ", nrow(completeData)," x ",ncol(completeData))
codebook("* `completeData` loaded in memory, dimensions: ", nrow(completeData)," x ",ncol(completeData))




# 
# ##### Common usage values==============================
# #Load feature variable names tables
# varnames <- read_table2("UCI HAR Dataset/features.txt",col_names = F, col_types = list("c","c"))
# varnames <- unlist(varnames[,2],use.names = F)
# 
# ##### Load Test datasets===================
# #Load test dataset subject identifier
# test_subjectid <- read_table2("UCI HAR Dataset/test/subject_test.txt", col_names = F, col_types = "i")
# test_subjectid <- unlist(test_subjectid,use.names = F)
# #Load test records activity label
# test_activitylabel <- read_table2("UCI HAR Dataset/TEST/y_test.txt", col_names = F, col_types = "i")
# test_activitylabel <- unlist(test_activitylabel, use.names = F)
# #Load test dataset feature  values
# test <- suppressMessages(suppressWarnings(read_table2("UCI HAR Dataset/test/X_test.txt", col_names = varnames)))
# #Bind test records to test_subjectid and test_activitylabel
# test <- cbind(subjectid=test_subjectid, test, activity=test_activitylabel)
# 
# ##### Load train dataset====================
# #Load train dataset subject identifier
# train_subjectid <- read_table2("UCI HAR Dataset/train/subject_train.txt", col_names = F, col_types = "i")
# train_subjectid <- unlist(train_subjectid,use.names = F)
# #Load test records activity label
# train_activitylabel <- read_table2("UCI HAR Dataset/train/y_train.txt", col_names = F, col_types = "i")
# train_activitylabel <- unlist(train_activitylabel, use.names = F)
# 
# #Load training dataset feature values
# train <- suppressMessages(suppressWarnings(
#     read_table2("UCI HAR Dataset/train/X_train.txt", col_names = varnames)
# ))
# #bind values to subject identifier
# train <- cbind(subjectid=train_subjectid, train,activity=train_activitylabel)
# 
# #####Bind test and train datasets -----
# HAR <- rbind(test,train)
# 
# ##2) Extracts only the measurements on the mean and standard deviation for each measurement.####
# meanStdFeatureColumns <- varnames[grep("(mean|std)\\(\\)",varnames)]
# HAR <- HAR[c("subjectid",meanStdFeatureColumns,"activity")]
# 
# ##3) Uses descriptive activity names to name the activities in the data set ####
# #####Load activity lables factor
# activitylabels <- read_table2("UCI HAR Dataset/activity_labels.txt",col_names = F,col_types = "ic")
# activitylabels <- unlist(activitylabels[,2],use.names = F)
# activitylabels <- factor(activitylabels, levels = activitylabels)
# #####Substitute activity variable integers for corresponding descriptive activity label
# HAR$activity <- activitylabels[HAR$activity]
# 
# ##4)Appropriately labels the data set with descriptive variable names.####
# 
# markedVarParts<- gsub("^(f|t)(Body|Gravity|BodyBody)(Acc|Gyro)(Jerk)?(Mag)?[\\-]*(mean|std|meanFreq)[\\(\\)\\-]*(X|Y|Z)?","",x)
# strsplit(markedVarParts,"\\|")
# 
# VarNameParts <- c("Domain","Acceleration Component","Sensor","Jerk","Magniture","Transformation","Axis")
