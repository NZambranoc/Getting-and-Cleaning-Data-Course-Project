# Peer Reviewed Assignment Code Book
generated 2017-06-27 16:43:10 during sourcing of `run_analysis.R`

## Actions performed on data:
* merging all test  and training datasets files into one dataset: `completeData`
* `completeData` loaded in memory, dimensions: `10299 x 563`
* Subsetted `completeData` into `meanstdData` keeping only the key columns and features containing `std` or `mean`, dimensions: `10299 x 68`
* Substituted activity variable ids for its corresponding descriptive activity label, dimensions: `10299 x 68`
* Melted `meanstdData` into `moltenData`, based on key columns, dimensions: `679734 x 4`
* Splited `feature variable` into its atomic components (7), each in a different column, and merged it to `moltenData`, dimensions: `679734 x 11`
* Casted `moltedData` into `tidyData` averaging each variable for each activity and each subject dimensions: `180 x 68`
`tidyData` loaded in memory, dimensions: `180 x 68`
* Dumped `tidyData` to file  `./UCI HAR Dataset/tidyData.txt`
* * *

## `moltenData` Variable
### Identifier Columns
Variable Name | Description
|---|---|
|Subject| Subject ID Number, int (1-30) |
|activity_id| Activity Labels, factor w/6 levels 

### Measure Columns
Variable Name | Description
|---|---|
|variable| Feature name, factor w/66 levels|
|value| Measured feature values, num (range: -1:1)|
|Domain| Mesurament Domain, factor w/2 levels `f (Freq)`,`t (Time)`|
|Acc_Component| Acceleration component, factor w/3 levels `Body`,`BodyBody`,`Gravity`|
|Sensor|Measurament sensor source & units of `value` variable, factor w/2 levels `Acc (Accelerometer in g's)`, `Gyro (Gyroscope in radian/seconds)`|
|Jerk|Jerk Signal indicator, factor w/2 levels `Jerk`,`""(non-Jerk)`|
|Magnitude|Magnitude Value indicator, factor w/2 levels `Mag`,`""(non-Mag)`|
|Transformation| Transformation applied signal values, factor w/2 levels `mean`,`std`|
|Axis| Measurament Axis, factor w/4 levels `x`,`Y`,`X`,`"" (no Axis)`| 

## `tidyData` Variable
### Identifier Columns
Variable Name | Description
|---|---|
|Subject| Subject ID Number, int (1-30) |
|activity_id| Activity Labels, factor w/6 levels 

### Measure Columns
Variable Name | Description
|---|---|
|tBodyAcc-mean()-X| Mean value of this feature, num (range: 0.2215982:0.301461)
|tBodyAcc-mean()-Y| Mean value of this feature, num (range: -0.04051395:-0.001308288)
|tBodyAcc-mean()-Z| Mean value of this feature, num (range: -0.1525139:-0.07537847)
|tBodyAcc-std()-X| Mean value of this feature, num (range: -0.9960686:0.6269171)
|tBodyAcc-std()-Y| Mean value of this feature, num (range: -0.9902409:0.616937)
|tBodyAcc-std()-Z| Mean value of this feature, num (range: -0.9876587:0.6090179)
|tGravityAcc-mean()-X| Mean value of this feature, num (range: -0.6800432:0.9745087)
|tGravityAcc-mean()-Y| Mean value of this feature, num (range: -0.4798948:0.9565938)
|tGravityAcc-mean()-Z| Mean value of this feature, num (range: -0.4950887:0.957873)
|tGravityAcc-std()-X| Mean value of this feature, num (range: -0.9967642:-0.8295549)
|tGravityAcc-std()-Y| Mean value of this feature, num (range: -0.9942476:-0.6435784)
|tGravityAcc-std()-Z| Mean value of this feature, num (range: -0.9909572:-0.6101612)
|tBodyAccJerk-mean()-X| Mean value of this feature, num (range: 0.0426881:0.130193)
|tBodyAccJerk-mean()-Y| Mean value of this feature, num (range: -0.03868721:0.05681859)
|tBodyAccJerk-mean()-Z| Mean value of this feature, num (range: -0.06745839:0.03805336)
|tBodyAccJerk-std()-X| Mean value of this feature, num (range: -0.9946045:0.544273)
|tBodyAccJerk-std()-Y| Mean value of this feature, num (range: -0.9895136:0.3553067)
|tBodyAccJerk-std()-Z| Mean value of this feature, num (range: -0.9932883:0.03101571)
|tBodyGyro-mean()-X| Mean value of this feature, num (range: -0.2057754:0.1927045)
|tBodyGyro-mean()-Y| Mean value of this feature, num (range: -0.2042054:0.02747076)
|tBodyGyro-mean()-Z| Mean value of this feature, num (range: -0.0724546:0.1791021)
|tBodyGyro-std()-X| Mean value of this feature, num (range: -0.9942766:0.2676572)
|tBodyGyro-std()-Y| Mean value of this feature, num (range: -0.9942105:0.4765187)
|tBodyGyro-std()-Z| Mean value of this feature, num (range: -0.9855384:0.5648758)
|tBodyGyroJerk-mean()-X| Mean value of this feature, num (range: -0.1572125:-0.02209163)
|tBodyGyroJerk-mean()-Y| Mean value of this feature, num (range: -0.07680899:-0.01320228)
|tBodyGyroJerk-mean()-Z| Mean value of this feature, num (range: -0.09249985:-0.006940664)
|tBodyGyroJerk-std()-X| Mean value of this feature, num (range: -0.9965425:0.1791486)
|tBodyGyroJerk-std()-Y| Mean value of this feature, num (range: -0.9970816:0.2959459)
|tBodyGyroJerk-std()-Z| Mean value of this feature, num (range: -0.9953808:0.1932065)
|tBodyAccMag-mean()| Mean value of this feature, num (range: -0.9864932:0.6446043)
|tBodyAccMag-std()| Mean value of this feature, num (range: -0.9864645:0.4284059)
|tGravityAccMag-mean()| Mean value of this feature, num (range: -0.9864932:0.6446043)
|tGravityAccMag-std()| Mean value of this feature, num (range: -0.9864645:0.4284059)
|tBodyAccJerkMag-mean()| Mean value of this feature, num (range: -0.9928147:0.4344904)
|tBodyAccJerkMag-std()| Mean value of this feature, num (range: -0.9946469:0.4506121)
|tBodyGyroMag-mean()| Mean value of this feature, num (range: -0.9807408:0.4180046)
|tBodyGyroMag-std()| Mean value of this feature, num (range: -0.9813727:0.299976)
|tBodyGyroJerkMag-mean()| Mean value of this feature, num (range: -0.9973225:0.08758166)
|tBodyGyroJerkMag-std()| Mean value of this feature, num (range: -0.9976661:0.2501732)
|fBodyAcc-mean()-X| Mean value of this feature, num (range: -0.9952499:0.537012)
|fBodyAcc-mean()-Y| Mean value of this feature, num (range: -0.9890343:0.5241877)
|fBodyAcc-mean()-Z| Mean value of this feature, num (range: -0.9894739:0.280736)
|fBodyAcc-std()-X| Mean value of this feature, num (range: -0.9966046:0.6585065)
|fBodyAcc-std()-Y| Mean value of this feature, num (range: -0.9906804:0.5601913)
|fBodyAcc-std()-Z| Mean value of this feature, num (range: -0.9872248:0.6871242)
|fBodyAccJerk-mean()-X| Mean value of this feature, num (range: -0.9946308:0.4743173)
|fBodyAccJerk-mean()-Y| Mean value of this feature, num (range: -0.9893988:0.2767169)
|fBodyAccJerk-mean()-Z| Mean value of this feature, num (range: -0.9920184:0.1577757)
|fBodyAccJerk-std()-X| Mean value of this feature, num (range: -0.9950738:0.4768039)
|fBodyAccJerk-std()-Y| Mean value of this feature, num (range: -0.9904681:0.3497713)
|fBodyAccJerk-std()-Z| Mean value of this feature, num (range: -0.9931078:-0.006236475)
|fBodyGyro-mean()-X| Mean value of this feature, num (range: -0.9931226:0.4749624)
|fBodyGyro-mean()-Y| Mean value of this feature, num (range: -0.9940255:0.328817)
|fBodyGyro-mean()-Z| Mean value of this feature, num (range: -0.9859578:0.4924144)
|fBodyGyro-std()-X| Mean value of this feature, num (range: -0.9946522:0.1966133)
|fBodyGyro-std()-Y| Mean value of this feature, num (range: -0.9943531:0.6462336)
|fBodyGyro-std()-Z| Mean value of this feature, num (range: -0.9867253:0.5224542)
|fBodyAccMag-mean()| Mean value of this feature, num (range: -0.9868006:0.5866376)
|fBodyAccMag-std()| Mean value of this feature, num (range: -0.9876485:0.1786846)
|fBodyBodyAccJerkMag-mean()| Mean value of this feature, num (range: -0.9939983:0.5384048)
|fBodyBodyAccJerkMag-std()| Mean value of this feature, num (range: -0.9943667:0.3163464)
|fBodyBodyGyroMag-mean()| Mean value of this feature, num (range: -0.9865352:0.2039798)
|fBodyBodyGyroMag-std()| Mean value of this feature, num (range: -0.9814688:0.2366597)
|fBodyBodyGyroJerkMag-mean()| Mean value of this feature, num (range: -0.9976174:0.1466186)
|fBodyBodyGyroJerkMag-std()| Mean value of this feature, num (range: -0.9975852:0.2878346)
