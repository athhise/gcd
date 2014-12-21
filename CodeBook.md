---
title: "CodeBook"
author: "Tantely Andriana"
date: "Saturday, December 20, 2014"
output: html_document
---
## Introduction
This code book is provided in order to make clear the different steps involved the R script.
To do this project, We have been provided data from the UCI data respository.  A detail description of the data set used in this work can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Data Cleaning process
The variables names provided in the file "feature.txt" was not cleared. So we have to clean the variables names by removing the parenthesis () which didn't brought some information.

We added the activity label to the data set in order to make it clear what activity was performed by each volunters. So we cam see the measures for that activity.

## Step involved in the R script


In the first part of the code, we have provided code to download and unzip the data and save it into a folder called "data".
But as this has not been required in the assignement, we put the code into comment.
  
The  assignement asked to do the following:

        1. Merges the training and the test sets to create one data set.
        2. Extracts only the measurements on the mean and standard deviation for each measurement.
        3. Uses descriptive activity names to name the activities in the data set
        4. Appropriately labels the data set with descriptive variable names.
        5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As the order of doing the assignement was not an obligation, we have done the step 1 , 3 and 4 at the same time before doing step 2.

#### STEP 1,3 and 4               

These steps have been done as following:

               1. We have loaded the training data from the file "X_train.txt"
               2. we have assigned variables names to each variable using the names in the file "features.txt"
               3. we have added the activity performed to the training dataset using the file "y_train.txt"
               4. then we have labeled the activities using the file "activity_labels.txt"
               5. finally for the training set, we have added the individual label from "subject_train.txt" to the dataset.

At the end of these process we have in memory the training set loaded.
       We performed the same process for the test set.
       
       After having loaded the training set and test set into the memory, we merged these two dataset into a data frame called "data".


#### STEP 2               

Now we turn to step 2 of the assignement which consist in extracting only the measurements on the mean and standard deviation for each measurement.
To do this step, we have applied the concepts learnt from week 4 (editing text variables) . We searched for the expressions "mean", "Mean" and "sd" 
in the variables names to find the list of variables to extract from the dataset.
We have then subset the data set to these variables, the ID variable and the activity performed.


#### STEP 5

 Now we turn to the last step of the assignment: step 5.       
       To complete this step, we used the power of the dplyr package. We have transformed the data frame into a tbl_df first then we have grouped the data by "ID" and "Activity"
finally we asked for the mean of each variable by group we have defined previously.

The tidy data set is finally saved in your current working directory.





## Variables in the final tidy data
The list of variables in the tidy data set are:


* ID is the id number of each participants in the experience.

* Activity is the activity performed by the participant.

* tBodyAcc-mean-X

* tBodyAcc-mean-Y

* tBodyAcc-mean-Z

* tGravityAcc-mean-X

* tGravityAcc-mean-Y

* tGravityAcc-mean-Z

* tBodyAccJerk-mean-X

* tBodyAccJerk-mean-Y

* tBodyAccJerk-mean-Z

* tBodyGyro-mean-X

* tBodyGyro-mean-Y

* tBodyGyro-mean-Z

* tBodyGyroJerk-mean-X

* tBodyGyroJerk-mean-Y

* tBodyGyroJerk-mean-Z

* tBodyAccMag-mean

* tGravityAccMag-mean

* tBodyAccJerkMag-mean

* tBodyGyroMag-mean

* tBodyGyroJerkMag-mean

* fBodyAcc-mean-X

* fBodyAcc-mean-Y

* fBodyAcc-mean-Z

* fBodyAcc-meanFreq-X

* fBodyAcc-meanFreq-Y

* fBodyAcc-meanFreq-Z

* fBodyAccJerk-mean-X

* fBodyAccJerk-mean-Y

* fBodyAccJerk-mean-Z

* fBodyAccJerk-meanFreq-X

* fBodyAccJerk-meanFreq-Y

* fBodyAccJerk-meanFreq-Z

* fBodyGyro-mean-X

* fBodyGyro-mean-Y

* fBodyGyro-mean-Z

* fBodyGyro-meanFreq-X

* fBodyGyro-meanFreq-Y

* fBodyGyro-meanFreq-Z

* fBodyAccMag-mean

* fBodyAccMag-meanFreq

* fBodyBodyAccJerkMag-mean

* fBodyBodyAccJerkMag-meanFreq

* fBodyBodyGyroMag-mean

* fBodyBodyGyroMag-meanFreq

* fBodyBodyGyroJerkMag-mean

* fBodyBodyGyroJerkMag-meanFreq

* angle(tBodyAccMean,gravity)

* angle(tBodyAccJerkMean),gravityMean)

* angle(tBodyGyroMean,gravityMean)

* angle(tBodyGyroJerkMean,gravityMean)

* angle(X,gravityMean)

* angle(Y,gravityMean)

* angle(Z,gravityMean)

* tBodyAcc-std-X

* tBodyAcc-std-Y

* tBodyAcc-std-Z

* tGravityAcc-std-X

* tGravityAcc-std-Y

* tGravityAcc-std-Z

* tBodyAccJerk-std-X

* tBodyAccJerk-std-Y

* tBodyAccJerk-std-Z

* tBodyGyro-std-X

* tBodyGyro-std-Y

* tBodyGyro-std-Z

* tBodyGyroJerk-std-X

* tBodyGyroJerk-std-Y

* tBodyGyroJerk-std-Z

* tBodyAccMag-std

* tGravityAccMag-std

* tBodyAccJerkMag-std

* tBodyGyroMag-std

* tBodyGyroJerkMag-std

* fBodyAcc-std-X

* fBodyAcc-std-Y

* fBodyAcc-std-Z

* fBodyAccJerk-std-X

* fBodyAccJerk-std-Y

* fBodyAccJerk-std-Z

* fBodyGyro-std-X

* fBodyGyro-std-Y

* fBodyGyro-std-Z

* fBodyAccMag-std

* fBodyBodyAccJerkMag-std

* fBodyBodyGyroMag-std

* fBodyBodyGyroJerkMag-std

