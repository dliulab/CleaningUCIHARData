The code book
==================

### Raw Data:

1. Information about the variables (including units!) in the data set not contained in the tidy data
	* the raw data information can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	* for this solution only the following raw data are processed:
		* subject: subject_train.txt & subject_test.txt
		* activity: y_train.txt & y_test.txt
		(the activity lables are contained in 'activity_labels.txt')
		* features (a 561-feature vector, the list of features are defined in the 'features.txt' source data file) X_train.txt & X_test.txt

1. Information about the summary choices made
	* the first summary is to capture the complete set of 561 features for each subject and each activity.
	* the second summary is to summarize only "the measurements on the mean and standard deviation for each measurement." by calculating the average of the variables whose names containing '-mean()' and '-std()'.

### The instruction list/script

The summarization performed is to captured in an R script ('run_analysis.R'):
1. you can run this script from any directory where you have write permission and that has sufficient storage for the raw and processed data.
1. you can lunch R and **source("run_analysis.R")** to reproduce the tidy datasets.


Here is a summary of the summarization steps performed:

## Creating Merged Tidy Dataset:
1. Step 1 - check if the raw data exists, if not, download the zip file from the web and unzip it to a local subfolder.
1. Step 2 - load the *features.txt* file, this has all the feature names for the 561-feature. We will use this list of names to name the 561 columns from the datasets.
1. Step 3 - load the *activity_labels.txt* file. We will cbind() these activity labels to the dataset to create an 'Activity' variable for the observations.
1. Step 4 - load the *train* sub-folder:
 	* Step 4.1 - load the *subject_train.txt* file. Each row identifies the subject who performed the activity for each training observation.
	* Step 4.2 - load the *X_train.txt* file. This is the **Training Set**, each row contains a 561-feature vector.
	* Step 4.3 - load the *y_train.txt* file. Each row identifies the activity for each training set observation.
	* Step 4.4 - rename the loaded data.frames from Steps 4.1-4.3 to have user-friendly colnames(): **Subject**, **Activity** and the **feature names** from the *features.txt* file.
	* Step 4.5 - cbind() the data.frames from Steps 4.1-4.3 into one tidy training dataset.
1. Step 5 - load the *test* sub-folder:
	 * Step 5.1 - load the *subject_test.txt* file. Each row identifies the subject who performed the activity for each test observation.
	* Step 5.2 - load the *X_test.txt* file. This is the **Test Set**, each row contains a 561-feature vector.
	* Step 5.3 - load the *y_test.txt* file. Each row identifies the activity for each test set observation.
	* Step 5.4 - rename the loaded data.frames from Steps 5.1-5.3 to have user-friendly colnames(): **Subject**, **Activity** and the **feature names** from the *features.txt* file.
	* Step 5.5 - cbind() the data.frames from Steps 5.1-5.3 into one tidy test dataset.
1. Step 6 - rbind() the two tidy datasets from Step 4.5 & 5.5 into one complete tidy dataset. Save the file as 'mergedDataset.txt'.

## Creating Summary Tidy Dataset:
1. Step 1 - Extracts only the measurements on the mean and standard deviation for each measurement using the tidy dataset created in previous section. (find the variable names that contain '-mean()' or '-std()', a total of 66 measurements were identified.)
1. Step 2 - Aggregate the dataset group by Subject and Activity columns.
1. Step 3 - Replace the old Subject and Activity columns with the newly generated Group.1 and Group.2 columns from the aggregate() operation.
1. Step 4 - rename the 66-measurement columns to reflect the new contents: avg-of-xxx.

## First Data Set Variables:

	Subject
	Activity
	tBodyAcc-mean()-X
	tBodyAcc-mean()-Y
	tBodyAcc-mean()-Z
	tBodyAcc-std()-X
	tBodyAcc-std()-Y
	tBodyAcc-std()-Z
	tGravityAcc-mean()-X
	tGravityAcc-mean()-Y
	tGravityAcc-mean()-Z
	tGravityAcc-std()-X
	tGravityAcc-std()-Y
	tGravityAcc-std()-Z
	tBodyAccJerk-mean()-X
	tBodyAccJerk-mean()-Y
	tBodyAccJerk-mean()-Z
	tBodyAccJerk-std()-X
	tBodyAccJerk-std()-Y
	tBodyAccJerk-std()-Z
	tBodyGyro-mean()-X
	tBodyGyro-mean()-Y
	tBodyGyro-mean()-Z
	tBodyGyro-std()-X
	tBodyGyro-std()-Y
	tBodyGyro-std()-Z
	tBodyGyroJerk-mean()-X
	tBodyGyroJerk-mean()-Y
	tBodyGyroJerk-mean()-Z
	tBodyGyroJerk-std()-X
	tBodyGyroJerk-std()-Y
	tBodyGyroJerk-std()-Z
	tBodyAccMag-mean()
	tBodyAccMag-std()
	tGravityAccMag-mean()
	tGravityAccMag-std()
	tBodyAccJerkMag-mean()
	tBodyAccJerkMag-std()
	tBodyGyroMag-mean()
	tBodyGyroMag-std()
	tBodyGyroJerkMag-mean()
	tBodyGyroJerkMag-std()
	fBodyAcc-mean()-X
	fBodyAcc-mean()-Y
	fBodyAcc-mean()-Z
	fBodyAcc-std()-X
	fBodyAcc-std()-Y
	fBodyAcc-std()-Z
	fBodyAccJerk-mean()-X
	fBodyAccJerk-mean()-Y
	fBodyAccJerk-mean()-Z
	fBodyAccJerk-std()-X
	fBodyAccJerk-std()-Y
	fBodyAccJerk-std()-Z
	fBodyGyro-mean()-X
	fBodyGyro-mean()-Y
	fBodyGyro-mean()-Z
	fBodyGyro-std()-X
	fBodyGyro-std()-Y
	fBodyGyro-std()-Z
	fBodyAccMag-mean()
	fBodyAccMag-std()
	fBodyBodyAccJerkMag-mean()
	fBodyBodyAccJerkMag-std()
	fBodyBodyGyroMag-mean()
	fBodyBodyGyroMag-std()
	fBodyBodyGyroJerkMag-mean()
	fBodyBodyGyroJerkMag-std()

## Second Data Set Variables:

	Subject
	Activity
	avg-of-tBodyAcc-mean()-X
	avg-of-tBodyAcc-mean()-Y
	avg-of-tBodyAcc-mean()-Z
	avg-of-tBodyAcc-std()-X
	avg-of-tBodyAcc-std()-Y
	avg-of-tBodyAcc-std()-Z
	avg-of-tGravityAcc-mean()-X
	avg-of-tGravityAcc-mean()-Y
	avg-of-tGravityAcc-mean()-Z
	avg-of-tGravityAcc-std()-X
	avg-of-tGravityAcc-std()-Y
	avg-of-tGravityAcc-std()-Z
	avg-of-tBodyAccJerk-mean()-X
	avg-of-tBodyAccJerk-mean()-Y
	avg-of-tBodyAccJerk-mean()-Z
	avg-of-tBodyAccJerk-std()-X
	avg-of-tBodyAccJerk-std()-Y
	avg-of-tBodyAccJerk-std()-Z
	avg-of-tBodyGyro-mean()-X
	avg-of-tBodyGyro-mean()-Y
	avg-of-tBodyGyro-mean()-Z
	avg-of-tBodyGyro-std()-X
	avg-of-tBodyGyro-std()-Y
	avg-of-tBodyGyro-std()-Z
	avg-of-tBodyGyroJerk-mean()-X
	avg-of-tBodyGyroJerk-mean()-Y
	avg-of-tBodyGyroJerk-mean()-Z
	avg-of-tBodyGyroJerk-std()-X
	avg-of-tBodyGyroJerk-std()-Y
	avg-of-tBodyGyroJerk-std()-Z
	avg-of-tBodyAccMag-mean()
	avg-of-tBodyAccMag-std()
	avg-of-tGravityAccMag-mean()
	avg-of-tGravityAccMag-std()
	avg-of-tBodyAccJerkMag-mean()
	avg-of-tBodyAccJerkMag-std()
	avg-of-tBodyGyroMag-mean()
	avg-of-tBodyGyroMag-std()
	avg-of-tBodyGyroJerkMag-mean()
	avg-of-tBodyGyroJerkMag-std()
	avg-of-fBodyAcc-mean()-X
	avg-of-fBodyAcc-mean()-Y
	avg-of-fBodyAcc-mean()-Z
	avg-of-fBodyAcc-std()-X
	avg-of-fBodyAcc-std()-Y
	avg-of-fBodyAcc-std()-Z
	avg-of-fBodyAccJerk-mean()-X
	avg-of-fBodyAccJerk-mean()-Y
	avg-of-fBodyAccJerk-mean()-Z
	avg-of-fBodyAccJerk-std()-X
	avg-of-fBodyAccJerk-std()-Y
	avg-of-fBodyAccJerk-std()-Z
	avg-of-fBodyGyro-mean()-X
	avg-of-fBodyGyro-mean()-Y
	avg-of-fBodyGyro-mean()-Z
	avg-of-fBodyGyro-std()-X
	avg-of-fBodyGyro-std()-Y
	avg-of-fBodyGyro-std()-Z
	avg-of-fBodyAccMag-mean()
	avg-of-fBodyAccMag-std()
	avg-of-fBodyBodyAccJerkMag-mean()
	avg-of-fBodyBodyAccJerkMag-std()
	avg-of-fBodyBodyGyroMag-mean()
	avg-of-fBodyBodyGyroMag-std()
	avg-of-fBodyBodyGyroJerkMag-mean()
	avg-of-fBodyBodyGyroJerkMag-std()
