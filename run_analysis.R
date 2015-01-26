## step 1: Merges the training and the test sets to create one data set.
## (1.1) reading all the data of test and training sets in different objects
tst_labels <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="label")
tst_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
tst_data <- read.table("UCI HAR Dataset/test/X_test.txt")
trn_labels <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="label")
trn_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
trn_data <- read.table("UCI HAR Dataset/train/X_train.txt")

## (1.2) mearging all the data of training and test sets
data <- rbind(cbind(tst_subjects, tst_labels, tst_data),
              cbind(trn_subjects, trn_labels, trn_data))

## step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
## (2.1) reading the features for data set
features <- read.table("UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

## (2.2) extracting features of mean and standard deviation
features_mean_stddiv <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

## (2.3) Extracting only the measurements on the mean and standard deviation for each measurement.
tidy1 <- data[, c(1, 2, features_mean_stddiv$V1+2)]

## step 3: Uses descriptive activity names to name the activities in the data set
## (3.1) reading the labels of activities
labels_activity <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

## (3.2) replacing labels in data with the label names
tidy1$label <- labels_activity[tidy1$label, 2]

## step 4: Appropriately labels the data set with descriptive variable names. 
valid_col <- c("subject", "label", features_mean_stddiv$V2)
valid_col <- tolower(gsub("[^[:alpha:]]", "", valid_col))
colnames(tidy1) <- valid_col

## step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
library(reshape2)
tidy2 <- ddply(melt(tidy1, id.vars=c("subject", "label")), .(subject, label), summarise, Average=mean(value))
names(tidy2) <- c("Subject","Activity","Average_Var_Subject")

## writing the tidy data in files for upload
write.table(tidy2, "tidy.txt", row.names=F,quote=T)
write.table(tidy1, "tidy1.txt", row.names=F,quote=T)
