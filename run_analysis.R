#------------------------Project on Getting and Cleaning Data------------------------------------#

#STEP 1 Ensure that you have downloaded the Samsung Dataset and it is located at your working directory.------


#STEP 2 Reading the relevant files----------------------------------------------------------------------------

#assigning the pats to readable strings
file1 <- "./UCI HAR Dataset/train/X_train.txt"
file2 <- "./UCI HAR Dataset/test/X_test.txt"
file3 <- "./UCI HAR Dataset/train/subject_train.txt"
file4 <- "./UCI HAR Dataset/test/subject_test.txt"
file5 <- "./UCI HAR Dataset/train/y_train.txt"
file6 <-"./UCI HAR Dataset/test/y_test.txt"

activity_labels <- "./UCI HAR Dataset/activity_labels.txt"
file_features <- "./UCI HAR Dataset/features.txt"


#reading the files 
train <- read.table(file1)
test <- read.table(file2)

#get subject id for train and test table
subject_train <- read.table(file3)
subject_test <- read.table(file4)


#get variable names 
var_names <- read.table(file_features)

#get activity names
labels <- read.table(activity_labels)

#get activity value for each subject on both train and test data sets 
activity_train <- read.table(file5)
activity_test <- read.table(file6)


#STEP 3:Assign collumn names to train and test ------------------------------------------------------
colnames(train) <- var_names[,2]
colnames(test) <-var_names[,2]

#STEP 4: Add column "Subject" specifying the subject under study to train and test data sets------------
train <- cbind(subject_train, train)
colnames(train)[1] <- "Subject"

test <-cbind(subject_test, test)
colnames(test)[1] <- "Subject"


train <- cbind(activity_train,train ) 
test <- cbind(activity_test, test )

names(train)[1]<-"activity"
names(test)[1]<-"activity"

#STEP 5: Combine test and train data sets ---------------------------------------------------
train_test <- rbind(train, test)

#STEP 6: Assign levels to the factor variable activity for subject activities-------------------
train_test$activity[train_test$activity == 1] <- 'walking'
train_test$activity[train_test$activity == 2] <- 'walkingUpstairs'
train_test$activity[train_test$activity == 3] <- 'walkingDownstairs'
train_test$activity[train_test$activity == 4] <- 'sitting'
train_test$activity[train_test$activity == 5] <- 'standing'
train_test$activity[train_test$activity == 6] <- 'laying'


#STEP 7: Excluding irrelevant variables---------------------------------------------------------------
result <- train_test[,c(2,1, 3:8)]

#Make tidy Variable names in the result-----------------------------------------------------------------

names<- c("subject", "activity", "xmean", "ymean", "zmean", "xstd", "ystd", "zstd")
colnames(result) <- names

#STEP 8: Generating a new data set showing 
#the the average of each variable for each activity and each subject. -----------------------------------
 
aveXmean <-aggregate(xmean ~ subject + activity, result,  mean)
aveYmean <- aggregate(ymean ~ subject + activity, result,  mean)
aveZmean <- aggregate(zmean ~ subject + activity, result,  mean)
aveXstd <-aggregate(xstd ~ subject + activity, result,  mean)
aveYstd <-aggregate(ystd ~ subject + activity, result,  mean)
aveZstd <-aggregate(zstd ~ subject + activity, result,  mean)

#merging the data frames with the means into one data frame called bodyaverages
list.of.data.frames = list(aveXmean, aveYmean, aveZmean, aveXstd, aveYstd, aveZstd)
bodyAverages = Reduce(function(...) merge(..., all=T, sort = F), list.of.data.frames)

#assigning names to the final dataset 
names<- c("subject", "activity", "avexmean", "aveymean", "avezmean", "avexstd", "aveystd", "avezstd")
colnames(bodyAverages) <- names
    

#STEP 9 : Creating the table in a .csv form -----------------------------------------------------------

write.table(bodyAverages, "bodyAverage.txt", sep="\t")

