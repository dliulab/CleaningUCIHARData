Getting and Cleaning UCI HAR Data
===========

Getting and Cleaning UCI (University of California, Irvine) HAR (Human Activity Recognition) Dataset.

The purpose of this project is to demonstrate using R to collect,
work with, and clean the UCI HAR data set.
The goal is to prepare tidy data that can be used for later analysis.
The solution produces 2 tidy datasets:
1) The first tidy dataset is to combine the training and testing data into a full dataset.
The dataset will have user-friendly measurement variable names, and user-friendly activity labels.
2) the second tidy dataset is to summarize the variables with average of each variable group by activity and subject.

This solution also provides a Code Book to define the processing flow and variable definitions.


What is included in this repository
====================

The following items are included:

1. The raw data (under the /data folder).
2. The tidy datasets produced by the solution.
	* 'mergedDataset.txt' contains the merged records from the training and the testing datasets.
	* 'datasetWithAverage.txt' contains the summary dataset. For each activity and each subject, the 'mean()' of the meansurement variables (only variable names containing '-mean() and '-std()' are summarized) are calculated.
3. A code book 'CodeBook.md' describing each variable and its values in the tidy data set. It also provides an explicit and exact recipe that the code 'run_analysis.R' has used to generate the datasets.

Here is a quick summary of the deliverables:

### The raw data

The raw data is obtained from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For more information about the source raw data, please visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### The tidy data set

1. Each variable you measure should be in one column:
	* both datasets contains 563 variables: subject, activity and 561-feature measurements.
2. Each different observation of that variable should be in a different row
	* the first dataset has one record for each experiment.
	* the second dataset has one record for each subject and each activity. 	
3. There should be one table for each "kind" of variable
	* the first dataset is one "kind" of variable -- the observations from the experiments.
	* the second dataset is another "kind" of variable, the means of meansurements of mean() and std() variables.
4. If you have multiple tables, they should include a column in the table that allows them to be linked
	* the two two datasets are not linked row-by-row, rather linked by the Subject and Activity variables.
