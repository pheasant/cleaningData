cleaningData
============

Assignment for "Getting and Cleaning Data" course in R

#-------run_analysis.R script on UCI HAR DATASET README------------------#

The R script run_analysis.R provides procedural coding in R for cleaning the data for Human Activity Recognition Using Smartphones Data Set. 

The present text provides a number of directions on top of the comments at the run_analysis.R script. 

STEP 1: Make sure that you have downloaded the Human Activity Recognition dataset from this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and unzipped it at your working directory. The script would not work with a zip file. 

STEP 2: The script reads the files included in the UCI HAR Dataset folder. In case you have used the UCI HAR Dataset folder as your working directory rewrite the file reading commands appropriately. 
For instance, file1 <- "./UCI HAR Dataset/train/X_train.txt" would be
file1 <- "./train/X_train.txt" and so on. 

Once the computer directory paths have been assigned to variables the script is ready to read them. Notice that the script initially reads distinct files for the train and the test data sets. 

STEP 3: The script uses the dataset features.txt which we named var_names as variable names for both the “train” and the “test” data set. Now the data sets start having some sense. 

STEP 4: The dataset specifying the subject under study is assigned to the train and the test sets. The variable for the subset is temporarily named “Subject”. 

STEP 5: Here the train and the test datasets are combined in a single one named train_test.

STEP 6: The values in the activity column are replaced by factor values according to the activity labels definition: 

1 walking
2 walkingUpstairs
3 walkingDownstairs
4 sitting
5 standing
6 laying

The train_test dataset is now ready to be used for research on any of the 561 initial variables. 

STEP 7: Keep only the Mean and Standard Deviation measurements as well as the Subject, the Category and the category indicators. Also the names are replaced with tidy ones which can allow for easiness in the analysis of the original data. 

STEP 8: A new data set is generated “bodyAverages”, this time showing the average of each variable for each activity and each subject. After merging the newly generated variables that present the averages, new relevant names are assigned to them.  To check the dataset type: View(bodyAverages).

STEP 9: The “bodyAverage” dataset is saved in your working directory in a .csv format. You are ready for exploring and researching the UCI Data! 









