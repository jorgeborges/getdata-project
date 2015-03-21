# CodeBook
This file describes the variables, the data, and any transformations or work performed to clean up the data.

##Original Dataset
The original data is the **UCI Machine Learning Repository - Human Activity Recognition Using Smartphones Data Set**. The original unaltered dataset (both for training and testing) is already included in the project inside the ```./dataset``` directory.

It represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

And a direct link to the data included in this repo can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

For a full description of the original data set, please see the author's README in: https://github.com/jorgeborges/getdata-project/blob/master/dataset/README.txt

##Tidy Dataset
Given the explanation of the original dataset, the purpose of this script is to create an independent tidy data set that:
* Merges the train and test data sets
* Tidy ups by providing descriptive names to values and labels
* Only contains the measurements on the mean and standard deviation for each measurement
* The final measurements are actually the average of each variable for each activity and each subject

## The Data
The final result is a data set that inlcudes the following columns:
* 'subject'; Unit: Numeric Identifier. The subject being measure, represented by a number
* 'activity'; Unit: Qualitative Factor. The activity the subject was performing when data was being collected, can be: walking, walking_upstairs, walking_downstairs, sitting, standing, laying
* 66 variable signals as features; Units are normalized beetween -1 and 1, these signals are the mean of estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. These columns are:
"tBodyAcc_mean_X"           "tBodyAcc_mean_Y"           "tBodyAcc_mean_Z"           "tBodyAcc_std_X"            "tBodyAcc_std_Y"            "tBodyAcc_std_Z"
"tGravityAcc_mean_X"        "tGravityAcc_mean_Y"        "tGravityAcc_mean_Z"        "tGravityAcc_std_X"         "tGravityAcc_std_Y"         "tGravityAcc_std_Z"
"tBodyAccJerk_mean_X"       "tBodyAccJerk_mean_Y"       "tBodyAccJerk_mean_Z"       "tBodyAccJerk_std_X"        "tBodyAccJerk_std_Y"        "tBodyAccJerk_std_Z"
"tBodyGyro_mean_X"          "tBodyGyro_mean_Y"          "tBodyGyro_mean_Z"          "tBodyGyro_std_X"           "tBodyGyro_std_Y"           "tBodyGyro_std_Z"
"tBodyGyroJerk_mean_X"      "tBodyGyroJerk_mean_Y"      "tBodyGyroJerk_mean_Z"      "tBodyGyroJerk_std_X"       "tBodyGyroJerk_std_Y"       "tBodyGyroJerk_std_Z"
"tBodyAccMag_mean"          "tBodyAccMag_std"           "tGravityAccMag_mean"       "tGravityAccMag_std"        "tBodyAccJerkMag_mean"      "tBodyAccJerkMag_std"
"tBodyGyroMag_mean"         "tBodyGyroMag_std"          "tBodyGyroJerkMag_mean"     "tBodyGyroJerkMag_std"      "fBodyAcc_mean_X"           "fBodyAcc_mean_Y"
"fBodyAcc_mean_Z"           "fBodyAcc_std_X"            "fBodyAcc_std_Y"            "fBodyAcc_std_Z"            "fBodyAccJerk_mean_X"       "fBodyAccJerk_mean_Y"
"fBodyAccJerk_mean_Z"       "fBodyAccJerk_std_X"        "fBodyAccJerk_std_Y"        "fBodyAccJerk_std_Z"        "fBodyGyro_mean_X"          "fBodyGyro_mean_Y"
"fBodyGyro_mean_Z"          "fBodyGyro_std_X"           "fBodyGyro_std_Y"           "fBodyGyro_std_Z"           "fBodyAccMag_mean"          "fBodyAccMag_std"
"fBodyBodyAccJerkMag_mean"  "fBodyBodyAccJerkMag_std"   "fBodyBodyGyroMag_mean"     "fBodyBodyGyroMag_std"      "fBodyBodyGyroJerkMag_mean" "fBodyBodyGyroJerkMag_std"

## Transformations Applied
1. The train and test sets are loaded separately, for each set we do the following
2. Load the data regarding the subjects
3. Load the data regarding the activity performed, these are turned into a 6 level factor with descriptive names
4. Load the actual measurements, the measurements are then filtered to get only means and standard deviations
5. All columns are put in place in the data frame, then appropiate descriptive labels are assigned to each column by cleaning and allowing only alphanumeric and undescore
6. The two sets, train and test, are merged
7. The tidy data set is created by melting the measurements and casting back using mean function, subject and activity are used as id columns. This produces a tidy data set with the average of each variable for each activity and each subject.

The result from step 7 is written to ```./getdata_tidy_set.txt```
