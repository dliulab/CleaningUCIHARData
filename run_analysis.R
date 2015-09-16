## setwd("/home/dliu/Documents/Coursera/CleaningData/project")
data.dir <- "data"
zip.file <- "getdata-projectfiles-UCI HAR Dataset.zip"
dataset.dir <- "UCI HAR Dataset"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(data.dir)) {
    dir.create(data.dir)
}
if (!file.exists(file.path(data.dir, zip.file))) {
	download.file(fileUrl,
                  destfile = file.path(data.dir, zip.file),
                  method = "curl",
                  mode="wb")
    dateDownloaded <- date()
    unzip(file.path(data.dir, zip.file), exdir="data")
}
list.files(data.dir)

## Locd Features
featureFile <- "features.txt"
features <- read.table(
	file = file.path(data.dir, dataset.dir, featureFile), sep="")
featureNames = features$V2

## Locd Activity Labels
activityFile <- "activity_labels.txt"
activities <- read.table(
	file = file.path(data.dir, dataset.dir, activityFile), sep="")
activityLabels = activities$V2

## Load Traning Subjects
train.dir <- "train"
train.subject.file <- "subject_train.txt"
train.subjects <- read.table(
	file = file.path(data.dir, dataset.dir, train.dir, train.subject.file), sep="")
names(train.subjects) <- "Subject"

## Load Training Set
x.train.file <- "X_train.txt"
y.train.file <- "y_train.txt"

Xtrain <- read.table(file.path(data.dir, dataset.dir, train.dir, x.train.file), sep = "")
names(Xtrain) <- featureNames
Ytrain = read.table(file.path(data.dir, dataset.dir, train.dir, y.train.file), sep = "")
names(Ytrain) <- "Activity"
Ytrain$Activity <- as.factor(Ytrain$Activity)
levels(Ytrain$Activity) <- activityLabels

## 'data.frame':   7352 obs. of  563 variables:
train.set <- cbind(Xtrain, train.subjects, Ytrain)

## Load Test Subjects
test.dir <- "test"
test.subject.file <- "subject_test.txt"
test.subjects <- read.table(
	file = file.path(data.dir, dataset.dir, test.dir, test.subject.file), sep="")
names(test.subjects) <- "Subject"

## Load Test Set
x.test.file <- "X_test.txt"
y.test.file <- "y_test.txt"

Xtest <- read.table(file.path(data.dir, dataset.dir, test.dir, x.test.file), sep = "")
names(Xtest) <- featureNames
Ytest = read.table(file.path(data.dir, dataset.dir, test.dir, y.test.file), sep = "")
names(Ytest) <- "Activity"
Ytest$Activity <- as.factor(Ytest$Activity)
levels(Ytest$Activity) <- activityLabels

## 'data.frame':   2947 obs. of  563 variables:
test.set <- cbind(Xtest, test.subjects, Ytest)

## Merges the training and the test sets to create one data set
## 	'data.frame':   10299 obs. of  563 variables:

all.set <- rbind(train.set, test.set)
meanStdCol <- grepl('-mean\\(\\)|-std\\(\\)', names(all.set), ignore.case = TRUE)
## Extracts only the measurements on the mean and standard deviation for each measurement. 
all.set <- all.set[,c('Subject', 'Activity', names(all.set)[meanStdCol])]
## Save merged data set as a txt file created with write.table() using row.name=FALSE
write.table(all.set, "mergedDataset.txt", sep="\t", row.names = FALSE)

## Second Tidy Dataset:
## tidy data set with the average of each variable for each activity and each subject.
tidy.set <- aggregate(all.set, by=list(all.set$Subject, all.set$Activity), FUN=mean)
tidy.set$Activity <- NULL
tidy.set$Subject <- NULL
names(tidy.set)[names(tidy.set) == 'Group.1'] <- 'Subject'
names(tidy.set)[names(tidy.set) == 'Group.2'] <- 'Activity'

## Save tidy data set as a txt file created with write.table() using row.name=FALSE
write.table(tidy.set, "datasetWithAverage.txt", sep="\t", row.names = FALSE)




