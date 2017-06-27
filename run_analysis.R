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

codebook("* merging all test  and training datasets files into one dataset: `completeData`")
##1) Merge the training and the test sets to create one data set####
step("[1] Merging the training and the test sets to create one data set.")

## Combine all _test and _train dataset pairs by row
keyCols <- character() #Vector containing key vars col names

#Subject data
step("\t- Combining test& train subjects sets")
data_subject <- rbind(data_subject_test,data_subject_train)
names(data_subject) <- "subject"
keyCols <- c(keyCols,names(data_subject))
rm(data_subject_test)
rm(data_subject_train)

#Activity data
step("\t- Combining test & train subject sets")
data_y <- rbind(data_y_test,data_y_train)
names(data_y) <- "activity_id"
keyCols <- c(keyCols,names(data_y))
rm(data_y_test)
rm(data_y_train)

#Measuraments data
step("\t- Combining test & train features sets")
data_x <- rbind(data_X_test,data_X_train)
featureFile <- file.path(DatasetDir,"features.txt")
featureNames <- read.table(featureFile)[,2]
names(data_x) <- featureNames
rm(data_X_test)
rm(data_X_train)


#Combine all Columns of the row-combined datasets into a single one
step("\t- Combining subject, activity & features datasets")
completeData <- cbind(data_subject,data_y, data_x)


step("\t - \"completeData\" loaded in memory: ", nrow(completeData)," x ",ncol(completeData))
codebook("* `completeData` loaded in memory, dimensions: ", nrow(completeData)," x ",ncol(completeData))

##2) Extracts only the measurements on the mean and standard deviation for each measurement.####
step("[2] Extracting mean and standard deviation measurements for each record.")
meanStdCols <- featureNames[grep("(mean|std)\\(\\)",featureNames)]
SubsetCols <- c(keyCols,as.character(meanStdCols))
meanstdData <- completeData[SubsetCols]
codebook("* subsetted `completeData` into `meanstdData` keeping only the key columns and features containing `std` or `mean`, dimensions : ", nrow(meanstdData)," x ",ncol(meanstdData))


##3) Uses descriptive activity names to name the activities in the data set ####
step("[3] Using descriptive activity names instead of activity ids")
#####Load activity lables factor
activityFile <- file.path(DatasetDir,"activity_labels.txt")
activitylabels <- read.table(activityFile,stringsAsFactors = F)[,2]
activitylabels <- factor(activitylabels, levels = activitylabels)
#####Substitute activity variable integers for corresponding descriptive activity label
meanstdData$activity_id <- activitylabels[meanstdData$activity_id]
codebook("* Substituted activity variable ids for its corresponding descriptive activity label, dimensions:", nrow(meanstdData)," x ",ncol(meanstdData))


##4)Appropriately labels the data set with descriptive variable names.####
step("[4] Appropriately labeling the data set with descriptive variable names.")
moltenData <-  melt(meanstdData,keyCols)
codebook("* melted `meanstdData` into `moltenData`, based on key columns, dimensions : ", nrow(moltenData)," x ",ncol(moltenData))

#Split feature names into its atomic components
markedVarParts<- gsub("^(f|t)(Body|Gravity|BodyBody)(Acc|Gyro)(Jerk)?(Mag)?[\\-]*(mean|std|meanFreq)[\\(\\)\\-]*(X|Y|Z)?","\\1|\\2|\\3|\\4|\\5|\\6|\\7|",moltenData$variable)
splitVars <- strsplit(markedVarParts,"\\|")
ncols = length(splitVars[[1]])
nrows = length(splitVars)
variables <- matrix(unlist(splitVars),nrow = nrows,ncol = ncols,byrow = T )[1:3,1:7]
variables <- data.frame(variables,stringsAsFactors = F)
variablesNames <- c("Domain","Acc_Component","Sensor","Jerk","Magnitude","Transformation","Axis")
names(variables) <- variablesNames
#Join variables to molten data
moltenData <- cbind(moltenData,variables)
rm(markedVarParts)
rm(splitVars)
rm(variables)
rm(variablesNames)

codebook("* Split `feature variable`` into its atomic components (7), each in a different column, and merged it to `moltenData`, dimensions : ", nrow(moltenData)," x ",ncol(moltenData))

# tidyData


"a More programatic approach w/Code Book generator and steps printer on source"
