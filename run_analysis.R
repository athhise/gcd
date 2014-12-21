################################ Course project #######################
# 
# Thank you for evaluating this work.
# You are require to have the following package installed in order to run this code file :
#       - dplyr
#       -
# 
# In the first part of the code, we have provided code to download and unzip the data and save it into a folder called "data".
# But as this has not been required in the assignement, we put the code into comment.
#
#   
# The  assignement asked to do the following:

#        1. Merges the training and the test sets to create one data set.
#        2. Extracts only the measurements on the mean and standard deviation for each measurement.
#        3. Uses descriptive activity names to name the activities in the data set
#        4. Appropriately labels the data set with descriptive variable names.
#        5. From the data set in step 4, creates a second, independent tidy data set with the average of each
#                variable for each activity and each subject.
#
# As the order of doing the assignement was not an obligation, we have done the step 1 , 3 and 4 at the same time.

#               STEP 1,3 and 4               

#       These steps have been done as following:
#               1- We have loaded the training data from the file "X_train.txt"
#               2- we have assigned variables name to each variable using the names in the file "features.txt"
#               3- we have added the activity perform to the training dataset using the file "y_train.txt"
#               4- then we have labeled the activities using the file "activity_labels.txt"
#               5- finally for the training set, we have added to the dataset the individual label from "subject_train.txt"
#
#       At the end of these process we have in memory the training set loaded.
#       We performed the same process for the test set.
#       After having loaded the training set and test set into the memory, we merged these two dataset into a data frame called "data"
#
#
#               STEP 2               

# Now we turn to step 2 of the assignement which consist in extracting only the measurements on the mean and standard deviation for each measurement.
#       To do this step, we have applied the concept learnt from week 4(editing text variables) . We searched for the expressions "mean", "Mean" and "sd" 
#       in the variables names to find the list of variables to extract from the dataset.
#       We have then subset the data set to these variables, the ID variables and the activity performed.
#
#
#               STEP 5
#
# Now we turn to the last step of the assignment: step 5.       
#       To complete this step, we used the power of the dplyr package. We have transformed the data frame into a tbl_df first
#       then we have grouped the data by "ID" and "Activity"
#       finally we asked for the mean of each variable through the group we have defined previously.
#
#       The tidy data set is saved at the end.
#





################################ getting the data from the Website ##############################
#
#       if (!file.exists("data")){
#                dir.create("data")
#       }
#       #Set this directory created as the working directory
#       setwd("./data")

#       fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#       download.file(fileUrl,destfile="./data.zip",method="curl")
#       dateDownloaded<-date()
#       
#       #unzip the data set
#       unzip("data.zip")

#       unlink(url)
#       

################################ loading the training set ##############################

##load the training set
train<-read.table("./UCI HAR Dataset/train/X_train.txt")

#add the variable names
varname<-read.table("./UCI HAR Dataset/features.txt")
varname$V2<-as.character(varname$V2)
#remove the "()" in the variable name
varname$V2<-sub("\\()","",varname$V2)
varname$V2<-as.factor(varname$V2)
dimnames(train)<-list(1:nrow(train),varname$V2)


#add activity 
activity<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names="Activity")
train<-cbind(activity, train)

#add activity label
activity_lab<-read.table("./UCI HAR Dataset/activity_labels.txt")
train$Activity<-factor(train$Activity,labels=activity_lab$V2)

#add the individu label
rowid<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="ID")
train<-cbind(rowid, train)


################################# loading the test set ##################################
#loading the test set
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
dimnames(test)<-list(1:nrow(test),varname$V2)

#add activity 
activity<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names="Activity")
test<-cbind(activity, test)

#add activity label
test$Activity<-factor(test$Activity,labels=activity_lab$V2)

#add the individu label
rowid<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="ID")
test<-cbind(rowid, test)


################################ merge the training and the test set ##################
data<-rbind(train ,test)


################################ Extract the mean and standart deviation for each measurement###############

#use the "grepl" function to have the list of variable to extract 
var_to_keep_mean<-as.character(varname[grepl("mean",varname$V2),2])
var_to_keep_mean<-c(var_to_keep_mean,as.character(varname[grepl("Mean",varname$V2),2]))
var_to_keep_std<-as.character(varname[grepl("std",varname$V2),2])

# keep the mean and standart deviattion for each measurement
data<-data[,c("ID","Activity",var_to_keep_mean,var_to_keep_std)]

dim(data)
names(data)


################################ Create a tidy data set with the average of each variable for each activity and each subject

#building a tidy data set

library(dplyr)
data<-tbl_df(data)
data_grouped<-group_by(data,ID, Activity)
tidy_df<-summarise_each(data_grouped,funs(mean))

tidy_df<-as.data.frame(tidy_df)

############################### Save the tidy data frame as a txt file named "Tidy_Data"
# Save the data frame as a txt file
write.table(tidy_df,file="Tidy_Data.txt",row.names=FALSE)
