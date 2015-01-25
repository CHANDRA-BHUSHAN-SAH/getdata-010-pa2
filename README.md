## Peer Assessments /Getting and Cleaning Data Course Project

### Following are the Steps of Problem

	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	
#### Note:

*You should have dataset in a folder named "UCI HAR Dataset" in your current working directory*
*You can download the dataset from the following link and extract it your PWD*
	(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
*Download the code file named "run_analysis.R" in your PWD*
*The RStudio should installed the packages named "plyr" and "reshape2"*



### Use the following command to execute the codes of file "run_analysis.R"
  **source("run_analysis.R")**
  

#### The following file will be generated as the result of the source code file "run_analysis.R"
**tidy.txt :** The file "tidy.txt" contains the result of the step 5 which is the final result

**tidy1.txt:** The file "tidy1.txt" contains the intermediate resut through step 1 to step 4 that is the merged data set
  

#### Rest processing of codes is described in the same file i.e. "run_analysis.R"
